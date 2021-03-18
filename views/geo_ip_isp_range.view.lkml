view: geo_ip_isp_range {
  sql_table_name: `networktest.GeoIP_ISP_Range`
    ;;

  dimension: asn {
    type: string
    sql: ${TABLE}.asn ;;
  }

  dimension: aso {
    type: string
    sql: ${TABLE}.aso ;;
  }

  dimension: end_ip {
    type: string
    sql: ${TABLE}.end_IP ;;
  }

  dimension: end_ip_byte {
    type: string
    sql: ${TABLE}.end_ip_byte;;
  }
  dimension: start_ip_byte {
    type: string
    sql:${TABLE}.start_ip_byte ;;
  }

  dimension: isp {
    type: string
    sql: ${TABLE}.isp ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: start_ip {
    type: string
    sql: ${TABLE}.start_IP ;;
  }

  dimension: constant_for_left_join {
    type: number
    sql: if(asn='',1,1) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
