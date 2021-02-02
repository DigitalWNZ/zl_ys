view: borgmonfull {
  sql_table_name: `networktest.borgmonfull`
    ;;

  dimension: gcp_peer_asn {
    type: string
    sql: ${TABLE}.gcp_peer_asn ;;
  }

  dimension: metro {
    type: string
    sql: ${TABLE}.Metro ;;
  }

  dimension: peer_ipv4 {
    type: string
    sql: ${TABLE}.Peer_IPv4 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
