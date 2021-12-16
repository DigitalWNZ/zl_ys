view: gcp_hop {
  derived_table: {
#     sql: select
#           a.InsertID,
#           a.UserID,
#           a.clientIP,
#           a.Time,
#           tracert_array.Hop as Hop_gcp,
#           tracert_array.Delay as Delay_gcp,
#           borgmon.gcp_peer_asn
#           from `allen-first.zlong_trial.lzNetDigTest` a
#           cross join unnest(Tracert) tracert_array
#           join `.allen-first.zlong_trial.borgmonfull` borgmon on tracert_array.Hop = borgmon.Peer_IPv4
#           where a.diagtype=2
#        ;;

  sql:  with max_delay as (
            select insertID, array_agg(struct(tracert_array.hop,safe_cast(tracert_array.delay as int64) as delay) order by safe_cast(tracert_array.delay as int64) desc limit 1)[offset(0)].*
             from ${lz_net_dig_test.SQL_TABLE_NAME} a, unnest(Tracert) tracert_array
             where diagtype=2
             group by insertID),
             gcp_hop as (
             --select a.InsertID, a.UserID,a.clientIP,a.name,a.Time, tracert_array.Hop as Hop_gcp,tracert_array.Delay as Delay_gcp,borgmon.gcp_peer_asn,borgmon.Metro,
             select a.InsertID, a.UserID,a.clientIP,a.name,a.EventTime as Time, tracert_array.Hop as Hop_gcp,tracert_array.Delay as Delay_gcp,borgmon.gcp_peer_asn,borgmon.Metro,
             from ${lz_net_dig_test.SQL_TABLE_NAME} a
             cross join unnest(Tracert) tracert_array
             join `opscenter.networktest.borgmonfull` borgmon on tracert_array.Hop = borgmon.Peer_IPv4
             where a.diagtype=2)
             select x.InsertID, x.UserID,x.clientIP,x.name,x.Time, x.Hop_gcp,safe_cast(x.Delay_gcp as int64) Delay_gcp ,x.gcp_peer_asn,y.hop as max_delay_hop,y.delay as max_delay,x.Metro as metro,
             NET.SAFE_IP_FROM_STRING(x.clientIP) as ClientIP_byte,
             case when safe_cast(x.Delay_gcp as int64) = y.delay then 1 else 0 end as gcp_max
             from gcp_hop x
             left join max_delay y on x.insertID = y.insertID
             where x.Time  is not null;;
            # where safe_cast(x.Time as timestamp) is not null;;
}

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: insert_id {
  type: string
  sql: ${TABLE}.InsertID ;;
}

dimension: client_ip {
  type: string
  sql: ${TABLE}.clientIP ;;
}

  dimension: clientIP_byte {
    type: string
    sql:${TABLE}.ClientIP_byte;;
  }

dimension: name {
  type: string
  sql: ${TABLE}.name ;;
}

dimension: User_ID {
  type: string
  sql: ${TABLE}.UserID ;;
}

#   dimension: time {
#     type: string
#     sql: ${TABLE}.Time ;;
#   }

dimension_group: time {
  type: time
  timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
    day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
  # sql: timestamp(${TABLE}.time);;
  sql: ${TABLE}.time;;
}

dimension: hop_gcp {
  type: string
  sql: ${TABLE}.Hop_gcp ;;
}

#   dimension: delay_gcp {
#     type: number
#     sql: safe_cast(${TABLE}.Delay_gcp as INT64);;
#   }

dimension: delay_gcp {
  type: number
  sql: ${TABLE}.Delay_gcp;;
}

dimension: gcp_peer_asn {
  type: string
  sql: ${TABLE}.gcp_peer_asn ;;
}

dimension: Metro {
  type: string
  label: "GCP_Peer_Metro"
  sql: ${TABLE}.Metro ;;
}

dimension: asn_isp_peer {
  type: string
  sql: concat("Client ASN:",${geo_ip_isp_range.asn},",ISP:",${geo_ip_isp_range.isp},",GCP_Peer_ASN:",${gcp_peer_asn},",GCP_Peer_Metro:",${Metro},".") ;;
}


  dimension: asn_isp_peer_0422 {
    type: string
    sql: concat("Client ASN:",${geo_ip_isp_mask.asn},",ISP:",${geo_ip_isp_mask.isp},",GCP_Peer_ASN:",${gcp_peer_asn},",GCP_Peer_Metro:",${Metro},".") ;;
  }

dimension: max_delay_hop {
  type: string
  sql: ${TABLE}.max_delay_hop;;
}

dimension: max_delay {
  type: string
  sql: ${TABLE}.max_delay;;
}

dimension: gcp_max {
  type: number
  sql: ${TABLE}.gcp_max ;;
}

dimension: delay_gcp_hist {
  type:tier
  tiers: [10,20,30,40,50,60,70,80,90,100,110,120]
  sql: ${delay_gcp} ;;
  style: integer
}

set: detail {
  fields: [insert_id, client_ip,hop_gcp, delay_gcp]
}
}
