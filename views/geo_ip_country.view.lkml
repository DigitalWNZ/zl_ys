view: geo_ip_country {
  sql_table_name: `networktest.GeoIP_Country`
    ;;

  dimension: country_iso_code {
    type: string
    sql: ${TABLE}.country_iso_code ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}.country_name ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  measure: count {
    type: count
    drill_fields: [country_name]
  }
}
