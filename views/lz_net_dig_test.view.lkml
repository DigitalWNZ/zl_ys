view: lz_net_dig_test {
  sql_table_name: @{lzdiagtable}
    ;;

  dimension: average {
    type: number
    sql: ${TABLE}.Average ;;
  }

  dimension: average_interval {
    case: {
      when: {
        sql: ${average} > 0 AND ${average} <= 30;;
        label: "(0,30]"
      }
      when: {
        sql: ${average} > 30 AND ${average} <= 60;;
        label: "(30,60]"
      }
      when: {
        sql: ${average} > 60 AND ${average} <= 90;;
        label: "(60,90]"
      }
      when: {
        sql: ${average} > 90 AND ${average} <= 120;;
        label: "(90,120]"
      }
      when: {
        sql: ${average} > 120 AND ${average} <= 150;;
        label: "(120,150]"
      }
      when: {
        sql: ${average} > 150 AND ${average} <= 180;;
        label: "(150,180]"
      }
      when: {
        sql: ${average} > 180 AND ${average} <= 200;;
        label: "(180,200]"
      }
      when: {
        sql: ${average} > 200;;
        label: "(200+]"
      }
      else: "Invalid Value"
    }
  }

  dimension: client_ip {
    type: string
    sql: ${TABLE}.ClientIP ;;
  }

  dimension: clientIP_byte {
    sql: NET.SAFE_IP_FROM_STRING(${client_ip});;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.DeviceID ;;
  }

  dimension: diagtype {
    type: number
    sql: ${TABLE}.Diagtype ;;
  }

  dimension: error {
    type: string
    sql: ${TABLE}.Error ;;
  }

  dimension: insert_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.InsertID ;;
  }

  dimension: isp {
    type: string
    sql: ${TABLE}.ISP ;;
  }

  dimension: lost {
    type: number
    sql: ${TABLE}.Lost ;;
  }

  dimension: max {
    type: number
    sql: ${TABLE}.Max ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: net_type {
    type: number
    sql: ${TABLE}.Net_type ;;
  }

  dimension: platform {
    type: number
    sql: ${TABLE}.Platform ;;
  }

  dimension: target {
    type: string
    sql: ${TABLE}.Target ;;
  }

#   dimension: time {
#     type: string
#     sql: ${TABLE}.Time ;;
#   }

  # dimension_group: time {
  #   type: time
  #   timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
  #     day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
  #   sql: timestamp(${TABLE}.time);;
  # }

  dimension_group: time {
    type: time
    timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
      day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
    sql: ${TABLE}.EventTime;;
  }

  # dimension_group: time {
  #   type: time
  #   timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
  #     day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
  #   sql: timestamp(FORMAT_TIMESTAMP('%F %H:%M:%E*S', timestamp(${TABLE}.time), 'Asia/Shanghai'));;
  # }

  dimension_group: timekey {
    type: time
    timeframes: [time]
    # sql: TIMESTAMP_SECONDS(5*60 * DIV(UNIX_SECONDS(timestamp(${time_time})), 5*60)) ;;
    sql: TIMESTAMP_SECONDS(5*60 * DIV(UNIX_SECONDS(${time_raw}), 5*60)) ;;
  }

  dimension_group: timekey_10 {
    type: time
    timeframes: [time]
    # sql: TIMESTAMP_SECONDS(10*60 * DIV(UNIX_SECONDS(timestamp(${time_time})), 10*60)) ;;
    sql: TIMESTAMP_SECONDS(10*60 * DIV(UNIX_SECONDS(${time_raw}), 10*60)) ;;
  }

  dimension_group: timekey_30 {
    type: time
    timeframes: [time]
    # sql: TIMESTAMP_SECONDS(30*60 * DIV(UNIX_SECONDS(timestamp(${time_time})), 30*60)) ;;
    sql: TIMESTAMP_SECONDS(10*60 * DIV(UNIX_SECONDS(${time_raw}), 10*60)) ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.Total ;;
  }

  dimension: tracert {
    hidden: yes
    sql: ${TABLE}.Tracert ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.UserID ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: valid_count {
    type: count
    filters: [average: ">0"]
    drill_fields: [geo_ip_country.country,geo_ip_isp.asn,client_ip,average]
  }

  measure: sum_total {
    type: sum
    sql: ${TABLE}.total ;;
  }

  measure: sum_lost {
    type: sum
    sql: ${TABLE}.lost ;;
  }

  measure: count_distinct_ip {
    type: count_distinct
    sql: ${client_ip} ;;
  }

  # measure: lost_rate {
  #   type: number
  #   value_format_name: percent_2
  #   sql: if(${sum_total}=0,0,${sum_lost}/${sum_total} );;
  # }

  dimension:lost_rate_pur_record{
    type: number
    value_format_name: percent_2
    sql: if (${total}=0,0,${lost}/${total}) ;;
  }


  dimension: lost_rate_interval {
    case: {
      when: {
        sql: ${lost_rate_pur_record} = 0.0;;
        label: "0.0"
      }
      when: {
        sql: ${lost_rate_pur_record} > 0.0 AND ${lost_rate_pur_record} <= 0.3;;
        label: "(0.0,0.3]"
      }
      when: {
        sql: ${lost_rate_pur_record} > 0.3 AND ${lost_rate_pur_record} <= 0.5;;
        label: "(0.3,0.5]"
      }
      when: {
        sql: ${lost_rate_pur_record} > 0.5 AND ${lost_rate_pur_record} <= 0.7;;
        label: "(0.5,0.7]"
      }
      when: {
        sql: ${lost_rate_pur_record} > 0.7 AND ${lost_rate_pur_record} <= 0.9;;
        label: "(0.7,0.9]"
      }
      else:">0.9"
    }
  }

  dimension: constant_for_left_join {
    type: number
    sql: if(${average}=0 ,1,1) ;;
  }
  measure: lost_rate {
    type: average
    value_format_name: percent_2
    sql: ${lost_rate_pur_record} ;;
  }


  measure: pert_95 {
    type: percentile
    percentile: 95
    sql: ${average} ;;
    drill_fields: [client_ip,average]
  }
  measure: pert_90 {
    type: percentile
    percentile: 90
    sql: ${average} ;;
    drill_fields: [client_ip,average]
  }

  measure: pert_90_yh {
    type: percentile
    percentile: 90
    sql: ${average} ;;
    html:
    <br>P90: {{value}} </br>
    <br># of records: {{count._rendered_value}}</br>
    <br># of distince IP {{count_distinct_ip._rendered_value}}</br>
    ;;
    drill_fields: [client_ip,average]
  }

  measure: pert_80 {
    type: percentile
    percentile: 80
    sql: ${average} ;;
  }
  measure: pert_70 {
    type: percentile
    percentile: 70
    sql: ${average} ;;
  }
  measure: pert_60 {
    type: percentile
    percentile: 60
    sql: ${average} ;;
  }
  measure: pert_50 {
    type: percentile
    percentile: 50
    sql: ${average} ;;
  }
  measure: pert_40 {
    type: percentile
    percentile: 40
    sql: ${average} ;;
  }
  measure: pert_30 {
    type: percentile
    percentile: 30
    sql: ${average} ;;
  }
  measure: pert_20 {
    type: percentile
    percentile: 20
    sql: ${average} ;;
  }
  measure: pert_10 {
    type: percentile
    percentile: 10
    sql: ${average} ;;
  }

  measure: avg_average {
    type: average
    sql: ${average} ;;
    value_format_name: decimal_2
  }
}



view: lz_net_dig_test__tracert {
  dimension: delay {
    type: string
    sql: safe_cast(${TABLE}.Delay as INT64) ;;
  }
  dimension: delay_hist {
    type:tier
    tiers: [10,20,30,40,50,60,70,80,90,100,110,120]
    sql: ${delay} ;;
    style: integer
  }
  dimension: hop {
    type: string
    sql: ${TABLE}.Hop ;;
  }
}
