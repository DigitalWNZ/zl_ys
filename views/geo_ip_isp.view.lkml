view: geo_ip_isp {
  sql_table_name: `networktest.GeoIP_ISP`
    ;;

  dimension: asn {
    type: string
    sql: ${TABLE}.asn ;;
  }

  dimension: aso {
    type: string
    sql: ${TABLE}.aso ;;
  }

  dimension: isp {
    type: string
    sql: ${TABLE}.isp ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
