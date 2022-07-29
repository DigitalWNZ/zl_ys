include: "navigation_bar.view.lkml"
view: ip_asn {
  sql_table_name: `allen-first.yunceng.ipASN`
    ;;
  extends: [navigation_bar]

  dimension: asn {
    type: string
    sql: ${TABLE}.asn ;;
  }

  dimension: asn_desc {
    type: string
    sql: ${TABLE}.asn_desc ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: end_ip {
    type: string
    sql: ${TABLE}.end_ip ;;
  }

  dimension: start_ip {
    type: string
    sql: ${TABLE}.start_ip ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
