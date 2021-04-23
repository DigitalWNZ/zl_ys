view: geo_ip_isp_mask {
  sql_table_name: `opscenter.networktest.GeoIP_ISP_Mask`
    ;;

  dimension: asn {
    type: string
    sql: ${TABLE}.asn ;;
  }

  dimension: asn_yh {
    type: string
    sql: ${TABLE}.asn ;;
    # html: asn:{{value}} isp: {{isp._rendered_value}};;
  }

  dimension: aso {
    type: string
    sql: ${TABLE}.aso ;;
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

  dimension: isp {
    type: string
    sql: ${TABLE}.isp ;;
  }

  dimension: isp_yh {
    type: string
    sql: ${TABLE}.isp ;;
    html: isp: {{value}}  asn:{{asn._rendered_value}} cidr:{{network._rendered_value}} ;;
  }

  dimension: isp_yh_1 {
    type: string
    sql: ${TABLE}.isp ;;
    drill_fields: [network]
    link: {
      label: "Drill to Metro"
      url: "/dashboards/1052?ISP=\"{{value}}\""
    }
  }

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

  # dimension: constant_for_left_join {
  #   type: number
  #   sql: if(asn='',1,1) ;;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
}
