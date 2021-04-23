view: gcp_hop_dive {
  derived_table: {
    sql: select a.clientIP,a.Time, tracert_array.Hop as Hop_gcp,tracert_array.Delay as Delay_gcp,borgmon.gcp_peer_asn,borgmon.Metro,
       from `opscenter.network_diagnosis_asia.htzx_asia` a, unnest(Tracert) tracert_array
       join `opscenter.networktest.borgmonfull` borgmon on tracert_array.Hop = borgmon.Peer_IPv4
       where a.diagtype=2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client_ip {
    type: string
    sql: ${TABLE}.clientIP ;;
  }

  dimension: time {
    type: string
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
      time,
      hop_gcp,
      delay_gcp,
      gcp_peer_asn,
      metro
    ]
  }
}
