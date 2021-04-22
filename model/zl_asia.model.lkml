connection: "zl_asia"

# include all the views
include: "/views/**/*.view"
include: "/lookml_dashboard/**/*.dashboard"

datagroup: zl_su_sea_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: zl_su_sea_default_datagroup

explore: borgmonfull {}

explore: geo_ip_country {}

explore: geo_ip_country_range {}

explore: geo_ip_isp {}

explore: geo_ip_isp_range {}



explore: htzx_asia_update {
  sql_always_where:
  (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte})
  and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte});;

  join: geo_ip_country_range {
    type: left_outer
    sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${htzx_asia_update.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
    # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
    relationship: many_to_one
  }
  join: geo_ip_isp_range {
    type: left_outer
    sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${htzx_asia_update.client_ip}),16) = NET.IP_TRUNC(${geo_ip_isp_range.start_ip_byte},16) ;;
    # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
    relationship: many_to_one
  }
  # join: geo_ip_country_range {
  #   type: inner
  #   sql_on:NET.SAFE_IP_FROM_STRING(${htzx_asia_update.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
  #   relationship: many_to_one
  # }
  # join: geo_ip_isp_range {
  #   type: inner
  #   sql_on: NET.SAFE_IP_FROM_STRING(${htzx_asia_update.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
  #   relationship: many_to_one
  # }
  # join: geo_ip_country_range {
  #   type: left_outer
  #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${htzx_asia_update.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
  #   relationship: many_to_one
  # }
  # join: geo_ip_isp_range {
  #   type: left_outer
  #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${htzx_asia_update.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
  #   relationship: many_to_one
  # }
}

explore: lz_net_dig_test_1 {
  view_name: lz_net_dig_test
  sql_always_where: ${lz_net_dig_test.diagtype} = 1 and ${lz_net_dig_test.average}<=1000
  and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte})
  and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte});;

  join: geo_ip_country_range {
    type: left_outer
    sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
    # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
    relationship: many_to_one
  }
  join: geo_ip_isp_range {
    type: left_outer
    sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
    # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
    relationship: many_to_one
  }
  # join: geo_ip_country_range {
  #   type: inner
  #   sql_on:NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
  #   relationship: many_to_one
  # }
  # join: geo_ip_isp_range {
  #   type: inner
  #   sql_on: NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
  #   relationship: many_to_one
  # }
    # join: geo_ip_country_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
    #   relationship: many_to_one
    # }
    # join: geo_ip_isp_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
    #   relationship: many_to_one
    # }
  }



  explore: lz_net_dig_test_2 {
    view_name: lz_net_dig_test
    sql_always_where: ${lz_net_dig_test.diagtype} = 1 and ${lz_net_dig_test.average} > 0 and ${lz_net_dig_test.average}<=1000
    and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte})
    and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte});;
    join: geo_ip_country_range {
      type: left_outer
      sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
      # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
      relationship: many_to_one
    }
    join: geo_ip_isp_range {
      type: left_outer
      sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
      # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
      relationship: many_to_one
    }
      # join: geo_ip_country_range {
      #   type: inner
      #   sql_on:NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
      #   relationship: many_to_one
      # }
      # join: geo_ip_isp_range {
      #   type: inner
      #   sql_on: NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
      #   relationship: many_to_one
      # }
      # join: geo_ip_country_range {
      #   type: left_outer
      #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
      #   relationship: many_to_one
      # }
      # join: geo_ip_isp_range {
      #   type: left_outer
      #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
      #   relationship: many_to_one
      # }
    }

explore: lz_net_dig_test_2_1000_plus {
  view_name: lz_net_dig_test
  sql_always_where: (${lz_net_dig_test.diagtype} = 1 or ${lz_net_dig_test.diagtype} =4) and ${lz_net_dig_test.average} > 0 and ${lz_net_dig_test.average}>1000
    and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte})
    and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte});;
  join: geo_ip_country_range {
    type: left_outer
    sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
    # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
    relationship: many_to_one
  }
  join: geo_ip_isp_range {
    type: left_outer
    sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
    # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
    relationship: many_to_one
  }
}

explore: lz_net_dig_test_4 {
  view_name: lz_net_dig_test
  sql_always_where: ${lz_net_dig_test.diagtype} = 4 and ${lz_net_dig_test.average} > 0 and ${lz_net_dig_test.average}<=1000
  and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip}));;

  join: geo_ip_country_range {
    type: left_outer
    sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
    # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
    relationship: many_to_one
  }
  # join: geo_ip_isp_range {
  #   type: left_outer
  #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
  #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
  #   relationship: many_to_one
  # }
  # join: geo_ip_country_range {
  #   type: inner
  #   sql_on:NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
  #   relationship: many_to_one
  # }
  # join: geo_ip_isp_range {
  #   type: inner
  #   sql_on: NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
  #   relationship: many_to_one
  # }
    # join: geo_ip_country_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),8) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),8) ;;
    #   relationship: many_to_one
    # }
    # join: geo_ip_isp_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),8) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),8) ;;
    #   relationship: many_to_one
    # }
  }


explore: lz_net_dig_test_yh {
  view_name: lz_net_dig_test
  sql_always_where: ${lz_net_dig_test.diagtype} = 4 and ${lz_net_dig_test.average} > 0 and ${lz_net_dig_test.average}<=1000
    and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip}))
    and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}));;

  join: geo_ip_country_range {
    type: left_outer
    sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
    relationship: many_to_one
  }
  join: geo_ip_isp_range {
    type: left_outer
    sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${lz_net_dig_test.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
    relationship: many_to_one
  }
}

explore: lz_net_dig_test_4_above_95 {}

    explore: first_2_Hop {
      sql_always_where: ${Delay1} is not null and ${Delay0} is not null
      and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte})
      and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte});;
      # join: geo_ip_country_range {
      #   type: left_outer
      #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
      #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
      #   relationship: many_to_one
      # }
      # join: geo_ip_isp_range {
      #   type: left_outer
      #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
      #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
      #   relationship: many_to_one
      # }

      # join: geo_ip_country_range {
      #   type: inner
      #   sql_on:${first_2_hop.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
      #   relationship: many_to_one
      # }
      # join: geo_ip_isp_range {
      #   type: inner
      #   sql_on: ${first_2_hop.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
      #   relationship: many_to_one
      # }
      # join: geo_ip_country_range {
      #   type: inner
      #   sql_on:NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
      #   relationship: many_to_one
      # }
      # join: geo_ip_isp_range {
      #   type: inner
      #   sql_on: NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
      #   relationship: many_to_one
      # }
        join: geo_ip_country_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
          relationship: many_to_one
        }
        join: geo_ip_isp_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
          relationship: many_to_one
        }
      }

      explore: gcp_hop {
        sql_always_where:
        (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte})
        and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte});;
        # join: geo_ip_country_range {
        #   type: left_outer
        #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${gcp_hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
        #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: left_outer
        #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${gcp_hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
        #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
        #   relationship: many_to_one
        # }
        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:${gcp_hop.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: ${gcp_hop.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
        #   relationship: many_to_one
        # }
        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:NET.SAFE_IP_FROM_STRING(${gcp_hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: NET.SAFE_IP_FROM_STRING(${gcp_hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
        #   relationship: many_to_one
        # }
        join: geo_ip_country_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${gcp_hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
          relationship: many_to_one
        }
        join: geo_ip_isp_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${gcp_hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
          relationship: many_to_one
        }

      }

      explore: hop_by_ip {
        view_name: first_2_Hop
        sql_always_where:
        (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte})
        and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte});;
        join: gcp_hop {
          type: left_outer
          sql_on: ${first_2_Hop.insert_id}=${gcp_hop.insert_id} ;;
          relationship: one_to_one
        }
        join: geo_ip_country_range {
          type: left_outer
          sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
          # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
          relationship: many_to_one
        }
        join: geo_ip_isp_range {
          type: left_outer
          sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
          # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
          relationship: many_to_one
        }
        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:${first_2_Hop.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: ${first_2_Hop.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
        #   relationship: many_to_one
        # }
        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
        #   relationship: many_to_one
        # }

        # join: geo_ip_country_range {
        #   type: left_outer
        #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: left_outer
        #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_2_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
        #   relationship: many_to_one
        # }

      }

      explore: first_Hop{
        sql_always_where:(NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip}))
          and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}));;
        # join: geo_ip_country_range {
        #   type: left_outer
        #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
        #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: left_outer
        #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
        #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
        #   relationship: many_to_one
        # }
        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:${first_Hop.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: ${first_Hop.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
        #   relationship: many_to_one
        # }
        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:NET.SAFE_IP_FROM_STRING(${first_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: NET.SAFE_IP_FROM_STRING(${first_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
        #   relationship: many_to_one
        # }
        join: geo_ip_country_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
          relationship: many_to_one
        }
        join: geo_ip_isp_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${first_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
          relationship: many_to_one
        }
      }

      explore: second_Hop{
        sql_always_where:(NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip}))
          and (NET.SAFE_IP_FROM_STRING(${client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}));;
        # join: geo_ip_country_range {
        #   type: left_outer
        #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${second_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
        #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: left_outer
        #   sql_on:NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${second_Hop.client_ip}),16) = NET.IP_TRUNC(${geo_ip_country_range.start_ip_byte},16) ;;
        #   # or ${lz_net_dig_test.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
        #   relationship: many_to_one
        # }

        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:${second_Hop.clientIP_byte} BETWEEN ${geo_ip_country_range.start_ip_byte} AND ${geo_ip_country_range.end_ip_byte}  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: ${second_Hop.clientIP_byte} BETWEEN ${geo_ip_isp_range.start_ip_byte} AND ${geo_ip_isp_range.end_ip_byte};;
        #   relationship: many_to_one
        # }

        # join: geo_ip_country_range {
        #   type: inner
        #   sql_on:NET.SAFE_IP_FROM_STRING(${second_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})  ;;
        #   relationship: many_to_one
        # }
        # join: geo_ip_isp_range {
        #   type: inner
        #   sql_on: NET.SAFE_IP_FROM_STRING(${second_Hop.client_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}) ;;
        #   relationship: many_to_one
        # }
        join: geo_ip_country_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${second_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
          relationship: many_to_one
        }
        join: geo_ip_isp_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${second_Hop.client_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
          relationship: many_to_one
        }
      }

      explore: stat_from_cdn {
        sql_always_where:(NET.SAFE_IP_FROM_STRING(${remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip}))
          and (NET.SAFE_IP_FROM_STRING(${remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip}));;
        join: geo_ip_country_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${stat_from_cdn.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
          relationship: many_to_one
        }
        join: geo_ip_isp_range {
          type: left_outer
          sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${stat_from_cdn.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
          relationship: many_to_one
        }
      }

explore: cdn_transform {
  sql_always_where:NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})
  and NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip})
      ;;
  join: geo_ip_country_range {
    type: left_outer
    sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
    relationship: many_to_one
  }
  join: geo_ip_isp_range {
    type: left_outer
    sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
    relationship: many_to_one
  }

}


explore: retention_interval {
  sql_always_where:NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})
  and NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip});;
  join: geo_ip_country_range {
    type: left_outer
    sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
    relationship: many_to_one
  }
  join: geo_ip_isp_range {
    type: left_outer
    sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
    relationship: many_to_one
  }
}

explore: cdnlog {
  join: cdnlog__resource {
    view_label: "Cdnlog: Resource"
    sql: LEFT JOIN UNNEST([${cdnlog.resource}]) as cdnlog__resource ;;
    relationship: one_to_one
  }

  join: cdnlog__resource__labels {
    view_label: "Cdnlog: Resource Labels"
    sql: LEFT JOIN UNNEST([${cdnlog__resource.labels}]) as cdnlog__resource__labels ;;
    relationship: one_to_one
  }

  join: cdnlog__jsonpayload_type_loadbalancerlogentry {
    view_label: "Cdnlog: Jsonpayload Type Loadbalancerlogentry"
    sql: LEFT JOIN UNNEST([${cdnlog.jsonpayload_type_loadbalancerlogentry}]) as cdnlog__jsonpayload_type_loadbalancerlogentry ;;
    relationship: one_to_one
  }

  join: cdnlog__http_request {
    view_label: "Cdnlog: Httprequest"
    sql: LEFT JOIN UNNEST([${cdnlog.http_request}]) as cdnlog__http_request ;;
    relationship: one_to_one
  }

  join: cdnlog__source_location {
    view_label: "Cdnlog: Sourcelocation"
    sql: LEFT JOIN UNNEST([${cdnlog.source_location}]) as cdnlog__source_location ;;
    relationship: one_to_one
  }

  join: cdnlog__operation {
    view_label: "Cdnlog: Operation"
    sql: LEFT JOIN UNNEST([${cdnlog.operation}]) as cdnlog__operation ;;
    relationship: one_to_one
  }
}
