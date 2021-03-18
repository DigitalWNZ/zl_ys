view: stat_from_cdn {
  derived_table: {
    sql: select timestamp, receivetimestamp,httprequest.remoteIp, NET.SAFE_IP_FROM_STRING(httprequest.remoteIp) as RemoteIP_byte,httpRequest.responseSize, case when httpRequest.cacheHit then 1 else 0 end as cache_hit_int,
      from ${cdn_request_view.SQL_TABLE_NAME} where httprequest.remoteIp in (select clientIP from ${lz_net_dig_test.SQL_TABLE_NAME} where Diagtype = 1)
       ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP_TRUNC(${TABLE}.timestamp,SECOND);;
  }

  dimension_group: receivetimestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: TIMESTAMP_TRUNC(${TABLE}.receivetimestamp,SECOND);;
  }

  dimension_group: timekey {
    type: time
    timeframes: [time]
    sql: TIMESTAMP_SECONDS(5*60 * DIV(UNIX_SECONDS(timestamp(${timestamp_time})), 5*60)) ;;
  }

  dimension: remote_ip {
    type: string
    sql: ${TABLE}.remoteIp ;;
  }

  dimension: remoteIP_byte {
    type: string
    sql:${TABLE}.RemoteIP_byte;;
  }

  dimension: response_size {
    type: number
    sql: ${TABLE}.responseSize ;;
  }

  dimension: cache_hit_int {
    type: number
    sql: ${TABLE}.cache_hit_int ;;
  }

  measure: sum_requests {
    type: count
    drill_fields: [detail*]
  }


  measure: sum_resp_size {
    type: sum
    sql: ${response_size} ;;
  }

  measure: sum_cache_hit {
    type: sum
    sql: ${cache_hit_int} ;;
  }

  measure: cache_hit_rate {
    type: number
    value_format_name: percent_2
    sql: ${sum_cache_hit}/${sum_requests};;
  }


  set: detail {
    fields: [timestamp_time, receivetimestamp_time, remote_ip, response_size, cache_hit_int]
  }
}
