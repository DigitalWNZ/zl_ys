view: cdn_transform {
  derived_table: {
    sql: SELECT
      substr(jsonpayload_type_loadbalancerlogentry.cacheid,1,3) as metro,
      jsonpayload_type_loadbalancerlogentry.cacheid,
      jsonpayload_type_loadbalancerlogentry.statusdetails,
      timestamp,
      httpRequest.requestUrl,
      httpRequest.status,
      httpRequest.responseSize,
      httpRequest.userAgent,
      httpRequest.remoteIp,
      httpRequest.latency,
      httpRequest.cacheHit,
      httpRequest.cacheFillBytes
      FROM ${cdnlog.SQL_TABLE_NAME} clog
      where httpRequest.userAgent not like '%GFE%'
      ;;
  }



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_filtered {
    type: count
    filters: [status: "0,200,206", user_agent: "-%GFE%"]
  }

  measure: count_hit {
    type: count
    filters: [cache_hit:"-NULL"]
  }

  measure: count_hit_filtered {
    type: count
    filters: [cache_hit:"-NULL",status: "0,200,206", user_agent: "-%GFE%"]
  }

  measure: real_hit_rate {
    type: number
    sql: if (${count} = 0,0,${count_hit}/${count}) ;;
    value_format_name: percent_4
  }

  measure: real_hit_rate_filtered {
    type: number
    sql: if (${count_filtered} = 0,0,${count_hit_filtered}/${count_filtered}) ;;
    value_format_name: percent_4
  }

  measure: count_distinct_url {
    type: count_distinct
    sql: ${request_url} ;;
  }

  measure: count_distinct_url_filtered {
    type: count_distinct
    sql: ${request_url} ;;
    filters: [status: "0,200,206", user_agent: "-%GFE%"]
  }

  measure: expect_hit_rate {
    type: number
    sql: if (${count}=0,1,(1 - ${count_distinct_url}/${count}));;
    value_format_name: percent_4
  }

  measure: expect_hit_rate_filtered {
    type: number
    sql: if (${count_filtered}=0,0,(1 - ${count_distinct_url_filtered}/${count_filtered}));;
    value_format_name: percent_4
  }

  measure: latency_p50 {
    type: percentile
    percentile: 50
    sql: ${latency} ;;
    filters: [cache_hit: "NULL",status: "0,200,206", user_agent: "-%GFE%",latency: "<100"]
    value_format_name: decimal_2
  }

  measure: latency_p90 {
    type: percentile
    percentile: 90
    sql: ${latency} ;;
    filters: [cache_hit: "NULL",status: "0,200,206", user_agent: "-%GFE%",latency: "<100"]
    value_format_name: decimal_2
  }

  measure: latency_p95 {
    type: percentile
    percentile: 95
    sql: ${latency} ;;
    filters: [cache_hit: "NULL",status: "0,200,206", user_agent: "-%GFE%",latency: "<100"]
    value_format_name: decimal_2
  }

  measure: latency_p99 {
    type: percentile
    percentile: 99
    sql: ${latency} ;;
    filters: [cache_hit: "NULL",status: "0,200,206", user_agent: "-%GFE%",latency: "<100"]
    value_format_name: decimal_2
  }

  measure: latency_median {
    type: median
    sql: ${latency} ;;
    filters: [cache_hit: "NULL",status: "0,200,206", user_agent: "-%GFE%",latency: "<100"]
    value_format_name: decimal_2
  }

  measure: bandwidth {
    type: number
    sql: ${sum_resp_size_filtered}/{% parameter num_of_seconds %} * {% parameter num_of_bits %} ;;
    value_format_name: decimal_0
  }


  measure: sum_resp_size {
    type: sum
    sql: ${response_size}/(1024*1024*1024);;
    value_format_name: decimal_2
  }

  measure: sum_resp_size_filtered {
    type: sum
    sql: ${response_size}/(1024*1024*1024);;
    value_format_name: decimal_2
    filters: [status: "0,200,206", user_agent: "-%GFE%"]
  }

  measure: sum_resp_size_hit {
    type: sum
    sql: ${response_size} /(1024*1024*1024);;
    value_format_name: decimal_2
    filters: [cache_hit: "-NULL"]
  }

  measure: sum_resp_size_hit_filtered {
    type: sum
    sql: ${response_size} /(1024*1024*1024);;
    value_format_name: decimal_2
    filters: [cache_hit: "-NULL",status: "0,200,206", user_agent: "-%GFE%"]
  }

  measure: sum_resp_size_miss {
    type: sum
    sql: ${response_size} /(1024*1024*1024);;
    value_format_name: decimal_2
    filters: [cache_hit: "NULL",statusdetails: "response_sent_by_backend"]
  }

  measure: sum_resp_size_miss_filtered {
    type: sum
    sql: ${response_size} /(1024*1024*1024);;
    value_format_name: decimal_2
    filters: [cache_hit: "NULL",statusdetails: "response_sent_by_backend",status: "0,200,206", user_agent: "-%GFE%"]
  }

  measure: sum_cache_fill {
    type: sum
    sql: ${cache_fill_bytes} /(1024*1024*1024);;
    value_format_name: decimal_2
  }

  measure: sum_cache_fill_filtered {
    type: sum
    sql: ${cache_fill_bytes} /(1024*1024*1024);;
    value_format_name: decimal_2
    filters: [status: "0,200,206", user_agent: "-%GFE%"]
  }

  measure: sum_non_cache_fill {
    type: number
    sql: ${sum_resp_size} - ${sum_cache_fill} ;;
  }

  measure: sum_non_cache_fill_filtered {
    type: number
    sql: ${sum_resp_size_filtered} - ${sum_cache_fill_filtered} ;;
  }

  measure: count_distinct_remote_ip {
    type: count_distinct
    sql: ${remote_ip} ;;
  }

  measure: count_distinct_remote_ip_filtered {
    type: count_distinct
    sql: ${remote_ip} ;;
    filters: [status: "0,200,206", user_agent: "-%GFE%"]
  }

  dimension: request_protocal {
    type: string
    sql: REGEXP_EXTRACT(${request_url}, r"([a-zA-Z0-9]+):\/\/") ;;
  }

  dimension: request_extension {
    type: string
    sql: REGEXP_EXTRACT(
      left(${request_url},if(strpos(${request_url},'?')=0,length(${request_url}),strpos(${request_url},'?')-1)),
      r"[a-zA-Z0-9_.+-]+\.([a-zA-Z0-9-]+)$"
      );;
    # REGEXP_EXTRACT(${request_url}, r"[a-zA-Z0-9_.+-]+\.([a-zA-Z0-9-.]+$)");;
    }

    # dimension: rank_test {
    #   type: number
    #   sql: rank() over (partition by ${ip_asn.country} order by ${count});;
    # }

    # dimension: country_rank {
    #   type: string
    #   sql:  ${rank_test} || ${ip_asn.country} ;;
    # }

    dimension: status_tier {
      type: tier
      tiers: [200,300,400,500]
      sql: ${status} ;;
    }


    dimension: metro {
      type: string
      sql: ${TABLE}.metro ;;
      drill_fields: [cacheid,ip_asn.asn]
    }

    dimension: cacheid {
      type: string
      sql: ${TABLE}.cacheid ;;
      drill_fields: [ip_asn.asn]
    }

    dimension: statusdetails {
      type: string
      sql: ${TABLE}.statusdetails ;;
    }

    dimension_group: timestamp {
      type: time
      timeframes: [time,date,hour]
      sql: ${TABLE}.timestamp ;;
    }


    parameter: num_of_seconds {
      description: "the number of seconds"
      type: unquoted
      default_value: "30"
    }

    parameter: num_of_bits {
      description: "the number of bits per byte"
      type: unquoted
      default_value: "8"
    }

    parameter: num_of_minutes {
      description: "the number of minutes"
      type: unquoted
      default_value: "15"
    }

    dimension: timekey {
      label_from_parameter: num_of_seconds
      type: string
      sql:
      safe_cast(TIMESTAMP_SECONDS({% parameter num_of_seconds %} * DIV(UNIX_SECONDS(timestamp(${timestamp_time})), {% parameter num_of_seconds %})) as string);;
    }

    dimension: timekey_min {
      label_from_parameter: num_of_minutes
      type: string
      sql:
      safe_cast(TIMESTAMP_SECONDS({% parameter num_of_minutes %}*60 * DIV(UNIX_SECONDS(timestamp(${timestamp_time})), {% parameter num_of_minutes %}*60)) as string);;
    }

    dimension: request_url {
      type: string
      sql: ${TABLE}.requestUrl ;;
    }

    dimension: status {
      type: number
      sql: ${TABLE}.status ;;
    }

    dimension: response_size {
      type: number
      sql: ${TABLE}.responseSize ;;
    }

    dimension: user_agent {
      type: string
      sql: ${TABLE}.userAgent ;;
    }

    dimension: remote_ip {
      type: string
      sql: ${TABLE}.remoteIp ;;
    }

    dimension: latency {
      type: number
      sql: ${TABLE}.latency ;;
    }

    dimension: cache_hit {
      type: string
      sql: ${TABLE}.cacheHit ;;
    }

    dimension: cache_fill_bytes {
      type: number
      sql: ${TABLE}.cacheFillBytes ;;
    }


    set: detail {
      fields: [
        metro,
        statusdetails,
        timestamp_time,
        request_url,
        status,
        response_size,
        user_agent,
        remote_ip,
        latency,
        cache_hit,
        cache_fill_bytes
      ]
    }
  }
