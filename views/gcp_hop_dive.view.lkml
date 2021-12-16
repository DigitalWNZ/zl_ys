view: gcp_hop_dive {
  derived_table: {
    sql:
       --select a.insertID,a.clientIP,a.Time, tracert_array.Hop as Hop_gcp,tracert_array.Delay as Delay_gcp,borgmon.gcp_peer_asn,borgmon.Metro,
       select a.insertID,a.clientIP,a.EventTime as Time, tracert_array.Hop as Hop_gcp,tracert_array.Delay as Delay_gcp,borgmon.gcp_peer_asn,borgmon.Metro,
       from `opscenter.network_diagnosis_asia.htzx_asia` a, unnest(Tracert) tracert_array
       join `opscenter.networktest.borgmonfull` borgmon on tracert_array.Hop = borgmon.Peer_IPv4
       where a.diagtype=2
       ;;
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

  dimension_group: time {
    type: time
    timeframes: [raw, time, date, hour,hour_of_day, day_of_week,
      day_of_week_index, time_of_day, week,month_num, month, year, quarter,quarter_of_year]
    # sql: safe_cast(${TABLE}.Time as timestamp) ;;
    sql: ${TABLE}.Time ;;
  }

  dimension: hop_gcp {
    type: string
    sql: ${TABLE}.Hop_gcp ;;
  }

  dimension: delay_gcp {
    type: string
    sql: safe_cast(${TABLE}.Delay_gcp as int64) ;;
  }

  dimension: gcp_peer_asn {
    type: string
    sql: ${TABLE}.gcp_peer_asn ;;
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.Metro ;;
    drill_fields: [client_ip]
    link: {
      label: "Drill to ISP"
      url: "/dashboards/1054?Metro={{ value }}&Time+Time={{_filters['gcp_hop_dive.time_time'] | url_encode}}&Country+Iso+Code={{_filters['geo_ip_country_mask.country_iso_code'] | url_encode}}&ISP={{ _filters['geo_ip_isp_mask.isp'] | url_encode }}&Asn={{ _filters['geo_ip_isp_mask.asn'] | url_encode }}&Diff+Asn+%28Yes+%2F+No%29={{ _filters['gcp_hop_dive.diff_asn'] | url_encode }}"
      }

  }

  dimension: diff_asn {
    type: yesno
    sql: ${gcp_peer_asn}=${geo_ip_isp_mask.asn};;
  }

  measure: delay_gcp_95 {
    type: percentile
    percentile: 95
    sql: ${delay_gcp} ;;
  }

  measure: delay_gcp_80 {
    type: percentile
    percentile: 80
    sql: ${delay_gcp} ;;
  }

  set: detail {
    fields: [
      client_ip,
      time_time,
      hop_gcp,
      delay_gcp,
      gcp_peer_asn,
      metro
    ]
  }
}
