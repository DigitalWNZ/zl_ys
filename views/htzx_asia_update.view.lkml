view: htzx_asia_update {
  sql_table_name:@{updateview}
    ;;

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

  dimension: downloadsize {
    type: number
    sql: ${TABLE}.Downloadsize ;;
  }

  dimension: error {
    type: string
    sql: ${TABLE}.Error ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.Filename ;;
  }

  dimension: filesize {
    type: number
    sql: ${TABLE}.Filesize ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.InsertID ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.Message ;;
  }

  dimension: net_type {
    type: string
    sql: ${TABLE}.NetType ;;
  }

  dimension: platform {
    type: number
    sql: ${TABLE}.Platform ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.Status ;;
  }

  # dimension: time {
  #   type: string
  #   sql: ${TABLE}.Time ;;
  # }

  dimension_group: time {
    type: time
    timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
      day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
    # sql: timestamp(${TABLE}.time);;
    sql: ${TABLE}.EventTime ;;
  }

  # dimension_group: time {
  #   type: time
  #   timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
  #     day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
  #   sql: ${TABLE}.EventTime;;
  # }

  dimension_group: timekey_30 {
    type: time
    timeframes: [time]
    # sql: TIMESTAMP_SECONDS(30*60 * DIV(UNIX_SECONDS(timestamp(${time_time})), 30*60)) ;;
    sql: TIMESTAMP_SECONDS(30*60 * DIV(UNIX_SECONDS(${time_raw}), 30*60)) ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.URL ;;
  }

  dimension: downloadspeed_row {
    type: number
    sql: if(${usetime}=0,0,${downloadsize}/${usetime});;
    value_format_name: decimal_2
  }

  dimension: usetime {
    type: number
    sql: ${TABLE}.Usetime ;;
  }
  dimension: usetime_no_null {
    type: number
    sql: ifnull(${usetime},0) ;;
  }

  # dimension:downloadsize_by_usetime{
  #   type: number
  #   sql: if (${usetime_no_null}=0,0,(${downloadsize}/1000000)/(${usetime_no_null}*1000)) ;;
  #   value_format_name: decimal_2
  # }


  measure: sum_downloadsize {
    type: sum
    sql: ${downloadsize}/1000 ;;
  }

  measure: sum_usetime {
    type: sum
    sql: ${usetime}/1000 ;;
  }

  measure: avg_download_speed {
    label: "Average Download Speed (KB/S)"
    type: average
    sql: ${downloadspeed_row} ;;
  }


  measure:downloadsize_by_usetime{
    label: "downloadsize_by_usetime(KB/S) "
    type: number
    sql: ${sum_downloadsize}/${sum_usetime} ;;
    value_format_name: decimal_2
  }

  measure: count {
    type: count
    drill_fields: [filename]
  }

  measure: count_status_1 {
    type: count
    filters: [status: "1"]
  }

  measure: count_status_1_rate {
    type: number
    sql: ${count_status_1}/${count} ;;
    value_format_name: percent_2
  }


}
