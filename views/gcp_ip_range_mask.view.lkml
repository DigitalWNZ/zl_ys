view: gcp_ip_range_mask {
  sql_table_name: `opscenter.networktest.gcp_ip_range_mask`
    ;;

  dimension: city_name {
    type: string
    sql: ${TABLE}.city_name ;;
  }

  dimension: country_city {
    type: string
    sql: ${TABLE}.country_city ;;
  }

  dimension: country_iso_code {
    type: string
    sql: ${TABLE}.country_iso_code ;;
  }

  dimension: end_ip {
    type: string
    sql: ${TABLE}.end_IP ;;
  }

  dimension: initial_ip {
    type: string
    sql: ${TABLE}.initial_ip ;;
  }

  dimension: mask {
    type: number
    sql: ${TABLE}.mask ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: network_bin {
    type: string
    sql: ${TABLE}.network_bin ;;
  }

  dimension: start_ip {
    type: string
    sql: ${TABLE}.start_IP ;;
  }

  measure: count {
    type: count
    drill_fields: [city_name]
  }
}
