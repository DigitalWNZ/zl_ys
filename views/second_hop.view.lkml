view: second_Hop {
  derived_table: {
    sql: select
      insertID,
      UserID,
      ClientIP,
      NET.SAFE_IP_FROM_STRING(ClientIP) as ClientIP_byte,
      name,
      --if(safe_cast(Time as timestamp) is null,null,Time) as Time,
      EventTime as time,
      if(array_length(Tracert)<=1,null,tracert[offset(1)].Hop) as Hop1,
      if(array_length(Tracert)<=1,null,tracert[offset(1)].Delay) as Delay1
      from ${lz_net_dig_test.SQL_TABLE_NAME}
      where diagtype=2
      and (if(array_length(Tracert)<=1,null,tracert[offset(1)].Hop) is not null and if(array_length(Tracert)<=1,null,tracert[offset(1)].Hop) != '@' and if(array_length(Tracert)<=1,null,tracert[offset(1)].Hop) != '*')
      and (if(array_length(Tracert)<=1,null,tracert[offset(1)].Delay) is not null and if(array_length(Tracert)<=1,null,tracert[offset(1)].Delay) != '@' and if(array_length(Tracert)<=1,null,tracert[offset(1)].Delay) != '*')
       ;;
  }

  measure: count {
    type: count
  }

  dimension: clientIP_byte {
    type: string
    sql:${TABLE}.ClientIP_byte;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertID ;;
  }

  dimension: client_ip {
    type: string
    sql: ${TABLE}.ClientIP ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: User_ID {
    type: string
    sql: ${TABLE}.UserID ;;
  }

  # dimension: Hop0 {
  #   type: string
  #   sql: ${TABLE}.Hop0 ;;
  # }

  # dimension: Delay0 {
  #   type: number
  #   sql: safe_cast(${TABLE}.Delay0 as INT64);;
  # }

  dimension_group: time {
    type: time
    timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
      day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
    # sql: timestamp(${TABLE}.time);;
    sql: ${TABLE}.time;;
  }

  # dimension: delay0_hist {
  #   type:tier
  #   tiers: [10,20,30,40,50,60,70,80,90,100,110,120]
  #   sql: ${Delay0} ;;
  #   style: integer
  # }

  dimension: Hop1 {
    type: string
    sql: ${TABLE}.Hop1 ;;
  }

  dimension: Delay1 {
    type: number
    sql: safe_cast(${TABLE}.Delay1 as INT64) ;;
  }

  dimension: delay1_hist {
    type:tier
    tiers: [10,20,30,40,50,60,70,80,90,100,110,120]
    sql: ${Delay1} ;;
    style: integer
  }

}
