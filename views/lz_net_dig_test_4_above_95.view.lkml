view: lz_net_dig_test_4_above_95 {
  derived_table: {
    sql: with raw_p95 as (SELECT
      geo_ip_country_mask.country_iso_code  AS geo_ip_country_mask_country_iso_code,
      lz_net_dig_test.EventTime as time,
      lz_net_dig_test.clientip,
      (FORMAT_TIMESTAMP('%F %T', TIMESTAMP_SECONDS(30*60 * DIV(UNIX_SECONDS(lz_net_dig_test.EventTime), 30*60)))) AS lz_net_dig_test_timekey_30_time,
      lz_net_dig_test.average,
      percentile_cont(average,0.95) over(partition by geo_ip_country_mask.country_iso_code,(FORMAT_TIMESTAMP('%F %T', TIMESTAMP_SECONDS(30*60 * DIV(UNIX_SECONDS(lz_net_dig_test.EventTime), 30*60))))) as p95,
      row_number() over(partition by geo_ip_country_mask.country_iso_code,(FORMAT_TIMESTAMP('%F %T', TIMESTAMP_SECONDS(30*60 * DIV(UNIX_SECONDS(lz_net_dig_test.EventTime), 30*60))))) as seq
      FROM ${lz_net_dig_test.SQL_TABLE_NAME} AS lz_net_dig_test,unnest(GENERATE_ARRAY(9,32)) mask
      INNER JOIN `opscenter.networktest.GeoIP_Country_Mask`
           AS geo_ip_country_mask ON NET.SAFE_IP_FROM_STRING(lz_net_dig_test.ClientIP) & NET.IP_NET_MASK(4, mask) = geo_ip_country_mask.network_bin and mask=geo_ip_country_mask.mask
      WHERE diagtype=4)
      select
      * except(seq) from raw_p95 where average > p95
      order by geo_ip_country_mask_country_iso_code, lz_net_dig_test_timekey_30_time
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client_ip {
    type: string
    sql: ${TABLE}.ClientIP ;;
  }

  dimension_group: time {
    type: time
    timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
      day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
    # sql: timestamp(${TABLE}.time);;
    sql: ${TABLE}.time;;
  }

  dimension: geo_ip_country_mask_country_iso_code {
    type: string
    sql: ${TABLE}.geo_ip_country_mask_country_iso_code ;;
  }

  dimension_group: lz_net_dig_test_timekey_30_time {
    type: time
    timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
      day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
    sql: timestamp(${TABLE}.lz_net_dig_test_timekey_30_time);;
  }

  dimension: average {
    type: number
    sql: ${TABLE}.average ;;
  }


  dimension: p95 {
    type: number
    sql: ${TABLE}.p95 ;;
  }

  measure: avg_average {
    type: average
    sql: ${average} ;;
  }

  set: detail {
    fields: [geo_ip_country_mask_country_iso_code, lz_net_dig_test_timekey_30_time, average, p95]
  }
}
