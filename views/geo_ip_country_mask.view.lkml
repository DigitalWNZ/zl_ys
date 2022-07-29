view: geo_ip_country_mask {
  sql_table_name: `opscenter.networktest.GeoIP_Country_Mask`
    ;;

  dimension: country_iso_code {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country_iso_code ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: end_ip {
    type: string
    sql: ${TABLE}.end_IP ;;
  }

  # dimension: end_ip_byte {
  #   type: string
  #   sql: ${TABLE}.end_ip_byte;;
  # }
  # dimension: start_ip_byte {
  #   type: string
  #   sql:${TABLE}.start_ip_byte ;;
  # }


  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: start_ip {
    type: string
    sql: ${TABLE}.start_IP ;;
  }

  dimension: initial_ip {
    type: string
    sql: ${TABLE}.initial_ip ;;
  }

  dimension: mask {
    type: number
    sql: ${TABLE}.mask ;;
  }

  dimension: network_bin {
    type: string
    sql: ${TABLE}.network_bin ;;
  }

  measure: count {
    type: count
    drill_fields: [country_name]
  }
}
