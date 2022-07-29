view: retention_interval {
  derived_table: {
    sql: with flat as (
       select
        substr(jsonpayload_type_loadbalancerlogentry.cacheid,1,3) as metro,
        timestamp,
        httpRequest.userAgent,
        httpRequest.remoteIp,
        httpRequest.status,
        jsonpayload_type_loadbalancerlogentry.statusdetails,
        jsonpayload_type_loadbalancerlogentry.cacheid,
        httpRequest.requestUrl,
        httpRequest.cacheHit,
        lag(substr(jsonpayload_type_loadbalancerlogentry.cacheid,1,3)) over (partition by httpRequest.requestUrl order by timestamp) as prev_metro,
        lag(timestamp) over (partition by httpRequest.requestUrl order by timestamp) as prev_timestamp,
        lag(httpRequest.cacheHit) over (partition by httpRequest.requestUrl order by timestamp) as prev_cache_hit
      from ${cdnlog.SQL_TABLE_NAME} clog)
      select *,timestamp_diff(timestamp, prev_timestamp,second) as retention_interval from flat
      where prev_timestamp is not null
      and cacheHit is null and prev_cache_hit=true ;;
  }

  parameter: url_pattern {
    allowed_value: {value: "%?sign=%"}
    allowed_value: {value: "other"}
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.metro ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.userAgent ;;
  }

  dimension: remote_ip {
    type: string
    sql: ${TABLE}.remoteIp ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: statusdetails {
    type: string
    sql: ${TABLE}.statusdetails ;;
  }

  dimension: cacheid {
    type: string
    sql: ${TABLE}.cacheid ;;
  }

  dimension: request_url {
    type: string
    sql: ${TABLE}.requestUrl ;;
  }

  dimension: cache_hit {
    type: string
    sql: ${TABLE}.cacheHit ;;
  }

  dimension: prev_metro {
    type: string
    sql: ${TABLE}.prev_metro ;;
  }

  dimension_group: prev_timestamp {
    type: time
    sql: ${TABLE}.prev_timestamp ;;
  }

  dimension: prev_cache_hit {
    type: string
    sql: ${TABLE}.prev_cache_hit ;;
  }

  dimension: retention_interval {
    type: number
    sql: ${TABLE}.retention_interval/3600 ;;
    # value_format_name: decimal_2
    value_format: "0.00 \" Hours\""
  }

  measure: retention_avg {
    type: average
    sql: ${retention_interval} ;;
    value_format: "0.00 \" Hours\""
  }
  measure: retention_interval_p99 {
    type: percentile
    percentile: 99
    sql: ${retention_interval} ;;
    value_format: "0.00 \" Hours\""
  }

  measure: retention_interval_p95 {
    type: percentile
    percentile: 95
    sql: ${retention_interval} ;;
    value_format: "0.00 \" Hours\""
  }

  measure: retention_interval_p90 {
    type: percentile
    percentile: 90
    sql: ${retention_interval} ;;
    value_format: "0.00 \" Hours\""
  }

  measure: retention_interval_p50 {
    type: percentile
    percentile: 50
    sql: ${retention_interval} ;;
    value_format: "0.00 \" Hours\""
  }

  set: detail {
    fields: [
      metro,
      timestamp_time,
      user_agent,
      remote_ip,
      status,
      statusdetails,
      cacheid,
      request_url,
      cache_hit,
      prev_metro,
      prev_timestamp_time,
      prev_cache_hit,
      retention_interval
    ]
  }
}
