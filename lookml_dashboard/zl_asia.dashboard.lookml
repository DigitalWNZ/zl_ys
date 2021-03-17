- dashboard: zl_asia
  title: zl_ASIA
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: hop_by_ip
    name: hop_by_ip
    model: zl_asia
    explore: hop_by_ip
    type: looker_grid
    fields: [geo_ip_country_range.country_iso_code, geo_ip_isp_range.isp, geo_ip_isp_range.asn,
      first_2_Hop.client_ip, gcp_hop.name, first_2_Hop.User_ID, first_2_Hop.Hop0,
      first_2_Hop.Delay0, first_2_Hop.Hop1, first_2_Hop.Delay1, gcp_hop.hop_gcp, gcp_hop.delay_gcp,
      gcp_hop.gcp_peer_asn, gcp_hop.max_delay_hop, gcp_hop.max_delay, gcp_hop.gcp_max,
      gcp_hop.Metro, asn_diff]
    filters:
      gcp_hop.client_ip: ''
    sorts: [first_2_Hop.client_ip desc]
    limit: 5000
    dynamic_fields: [{dimension: asn_diff, label: ASN_DIFF, expression: 'if(${geo_ip_isp_range.asn}!=${gcp_hop.gcp_peer_asn},1,0)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1ebd8493-ebcc-4e57-a4ff-ab3e6111da24, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: maximum}}, mirror: false,
            reverse: false, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [gcp_hop.gcp_max, gcp_hop.max_delay, gcp_hop.max_delay_hop]
    y_axes: []
    listen:
      Date: first_2_Hop.time_date
      Server Domain Name: first_2_Hop.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: first_2_Hop.client_ip
      GCP_PEER_ASN: gcp_hop.gcp_peer_asn
      Show Records Where GCP Hop is the highest: gcp_hop.gcp_max
    row: 101
    col: 0
    width: 24
    height: 8
  - title: lost_rate_by_country
    name: lost_rate_by_country
    model: zl_asia
    explore: lz_net_dig_test_1
    type: looker_line
    fields: [geo_ip_country_range.country_iso_code, lz_net_dig_test.lost_rate, lz_net_dig_test.timekey_30_time,
      geo_ip_country_range.country_name]
    pivots: [geo_ip_country_range.country_iso_code, geo_ip_country_range.country_name]
    sorts: [geo_ip_country_range.country_iso_code, lz_net_dig_test.timekey_30_time
        desc]
    limit: 5000
    total: true
    query_timezone: America/Los_Angeles
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 2
    col: 0
    width: 24
    height: 14
  - title: delay_gcp_hist
    name: delay_gcp_hist
    model: zl_asia
    explore: gcp_hop
    type: looker_column
    fields: [gcp_hop.delay_gcp_hist, gcp_hop.asn_isp_peer, gcp_hop.count]
    pivots: [gcp_hop.asn_isp_peer]
    fill_fields: [gcp_hop.delay_gcp_hist]
    sorts: [gcp_hop.delay_gcp_hist, gcp_hop.asn_isp_peer]
    limit: 5000
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Date: gcp_hop.time_date
      Server Domain Name: gcp_hop.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: gcp_hop.client_ip
      GCP_PEER_ASN: gcp_hop.gcp_peer_asn
    row: 79
    col: 16
    width: 8
    height: 12
  - title: ping_by_ip
    name: ping_by_ip
    model: zl_asia
    explore: lz_net_dig_test_1
    type: looker_grid
    fields: [geo_ip_country_range.country_iso_code, geo_ip_isp_range.isp, geo_ip_isp_range.asn,
      lz_net_dig_test.client_ip, lz_net_dig_test.name, lz_net_dig_test.user_id, lz_net_dig_test.pert_90,
      lz_net_dig_test.pert_80, lz_net_dig_test.pert_70, lz_net_dig_test.pert_60, lz_net_dig_test.pert_50,
      lz_net_dig_test.pert_40, lz_net_dig_test.pert_30, lz_net_dig_test.pert_20, lz_net_dig_test.pert_10]
    filters:
      lz_net_dig_test.isp: ''
    sorts: [lz_net_dig_test.pert_90 desc]
    limit: 5000
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      lz_net_dig_test.pert_90:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05, options: {steps: 5, constraints: {
              min: {type: number, value: 500}, mid: {type: middle}, max: {type: maximum}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 93
    col: 0
    width: 24
    height: 8
  - name: Ping Statistic By Country and Time
    type: text
    title_text: Ping Statistic By Country and Time
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Hop By ISP
    type: text
    title_text: Hop By ISP
    row: 77
    col: 0
    width: 24
    height: 2
  - name: Ping  and Trace Detail By IP
    type: text
    title_text: Ping  and Trace Detail By IP
    row: 91
    col: 0
    width: 24
    height: 2
  - title: stat_cdn_ip
    name: stat_cdn_ip
    model: zl_asia
    explore: stat_from_cdn
    type: looker_grid
    fields: [stat_from_cdn.remote_ip, stat_from_cdn.timekey_time, stat_from_cdn.cache_hit_rate,
      stat_from_cdn.sum_requests, stat_from_cdn.sum_resp_size]
    sorts: [stat_from_cdn.remote_ip desc]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Date: stat_from_cdn.timestamp_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: stat_from_cdn.remote_ip
    row: 149
    col: 0
    width: 24
    height: 7
  - title: stat_cdn_time
    name: stat_cdn_time
    model: zl_asia
    explore: stat_from_cdn
    type: looker_line
    fields: [stat_from_cdn.timekey_time, stat_from_cdn.cache_hit_rate, stat_from_cdn.sum_resp_size,
      stat_from_cdn.sum_requests]
    sorts: [stat_from_cdn.timekey_time]
    limit: 5000
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: stat_from_cdn.count,
            id: stat_from_cdn.count, name: Stat From Cdn}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: left, series: [{axisId: stat_from_cdn.sum_resp_size,
            id: stat_from_cdn.sum_resp_size, name: Sum Resp Size}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: stat_from_cdn.cache_hit_rate,
            id: stat_from_cdn.cache_hit_rate, name: Cache Hit Rate}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen:
      Date: stat_from_cdn.timestamp_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: stat_from_cdn.remote_ip
    row: 156
    col: 0
    width: 24
    height: 7
  - title: Number of Requests
    name: Number of Requests
    model: zl_asia
    explore: stat_from_cdn
    type: single_value
    fields: [stat_from_cdn.sum_requests]
    limit: 5000
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Date: stat_from_cdn.timestamp_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: stat_from_cdn.remote_ip
    row: 146
    col: 0
    width: 12
    height: 3
  - title: Sum of Response Size (Byte)
    name: Sum of Response Size (Byte)
    model: zl_asia
    explore: stat_from_cdn
    type: single_value
    fields: [stat_from_cdn.sum_resp_size]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Date: stat_from_cdn.timestamp_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: stat_from_cdn.remote_ip
    row: 146
    col: 12
    width: 12
    height: 3
  - title: lost_rate_interval_by_hour_v1
    name: lost_rate_interval_by_hour_v1
    model: zl_asia
    explore: lz_net_dig_test_1
    type: looker_column
    fields: [lz_net_dig_test.count, lz_net_dig_test.time_hour, lz_net_dig_test.lost_rate_interval]
    pivots: [lz_net_dig_test.lost_rate_interval]
    fill_fields: [lz_net_dig_test.time_hour, lz_net_dig_test.lost_rate_interval]
    sorts: [lz_net_dig_test.lost_rate_internval, lz_net_dig_test.time_hour desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date: lz_net_dig_test.time_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
    row: 16
    col: 0
    width: 24
    height: 10
  - title: pert90_by_country_v1
    name: pert90_by_country_v1
    model: zl_asia
    explore: lz_net_dig_test_2
    type: looker_line
    fields: [lz_net_dig_test.timekey_30_time, geo_ip_country_range.country_iso_code,
      lz_net_dig_test.pert_90, geo_ip_country_range.country_name]
    pivots: [geo_ip_country_range.country_iso_code, geo_ip_country_range.country_name]
    sorts: [lz_net_dig_test.timekey_30_time desc, geo_ip_country_range.country_iso_code]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: lz_net_dig_test.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 45
    col: 0
    width: 24
    height: 12
  - title: pert80_by_country_v1
    name: pert80_by_country_v1
    model: zl_asia
    explore: lz_net_dig_test_2
    type: looker_line
    fields: [lz_net_dig_test.timekey_30_time, geo_ip_country_range.country_iso_code,
      lz_net_dig_test.pert_80, geo_ip_country_range.country_name]
    pivots: [geo_ip_country_range.country_iso_code, geo_ip_country_range.country_name]
    sorts: [lz_net_dig_test.timekey_30_time desc, geo_ip_country_range.country_iso_code]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 57
    col: 0
    width: 24
    height: 12
  - title: First Hop Delay
    name: First Hop Delay
    model: zl_asia
    explore: first_Hop
    type: looker_column
    fields: [first_Hop.delay0_hist, first_Hop.count, geo_ip_isp_range.isp]
    pivots: [geo_ip_isp_range.isp]
    fill_fields: [first_Hop.delay0_hist]
    sorts: [first_Hop.delay0_hist, geo_ip_isp_range.isp]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date: first_Hop.time_date
      Server Domain Name: first_Hop.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: first_Hop.client_ip
    row: 79
    col: 0
    width: 8
    height: 12
  - title: Second Hop Delay
    name: Second Hop Delay
    model: zl_asia
    explore: second_Hop
    type: looker_column
    fields: [geo_ip_isp_range.isp, second_Hop.delay1_hist, second_Hop.count]
    pivots: [geo_ip_isp_range.isp]
    fill_fields: [second_Hop.delay1_hist]
    sorts: [second_Hop.delay1_hist, geo_ip_isp_range.isp]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date: second_Hop.time_date
      Server Domain Name: second_Hop.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: second_Hop.client_ip
    row: 79
    col: 8
    width: 8
    height: 12
  - title: Raw_data_ping
    name: Raw_data_ping
    model: zl_asia
    explore: lz_net_dig_test_1
    type: looker_grid
    fields: [geo_ip_country_range.country_iso_code, geo_ip_isp_range.isp, geo_ip_isp_range.asn,
      lz_net_dig_test.client_ip, lz_net_dig_test.name, lz_net_dig_test.user_id, lz_net_dig_test.average]
    filters:
      lz_net_dig_test.isp: ''
    sorts: [geo_ip_isp_range.asn]
    limit: 5000
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      lz_net_dig_test.pert_90:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05, options: {steps: 5, constraints: {
              min: {type: number, value: 500}, mid: {type: middle}, max: {type: maximum}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 69
    col: 0
    width: 24
    height: 8
  - title: ping_interval_by_isp
    name: ping_interval_by_isp
    model: zl_asia
    explore: lz_net_dig_test_1
    type: looker_column
    fields: [lz_net_dig_test.average_interval, geo_ip_isp_range.isp, lz_net_dig_test.valid_count]
    pivots: [geo_ip_isp_range.isp]
    fill_fields: [lz_net_dig_test.average_interval]
    sorts: [geo_ip_isp_range.isp 0, lz_net_dig_test.average_interval]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 35
    col: 0
    width: 24
    height: 10
  - title: ping_interval_by_country
    name: ping_interval_by_country
    model: zl_asia
    explore: lz_net_dig_test_1
    type: looker_column
    fields: [lz_net_dig_test.average_interval, geo_ip_country_range.country_iso_code,
      lz_net_dig_test.valid_count]
    pivots: [geo_ip_country_range.country_iso_code]
    fill_fields: [lz_net_dig_test.average_interval]
    sorts: [geo_ip_country_range.country_iso_code 0, lz_net_dig_test.average_interval]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 26
    col: 0
    width: 24
    height: 9
  - title: pos_status_by_30m
    name: pos_status_by_30m
    model: zl_asia
    explore: htzx_asia_update
    type: looker_line
    fields: [htzx_asia_update.timekey_30_time, htzx_asia_update.count_status_1]
    sorts: [htzx_asia_update.timekey_30_time desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date: htzx_asia_update.time_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: htzx_asia_update.client_ip
    row: 111
    col: 0
    width: 24
    height: 8
  - title: sum_downloadsize_by_usetime_30m
    name: sum_downloadsize_by_usetime_30m
    model: zl_asia
    explore: htzx_asia_update
    type: looker_line
    fields: [htzx_asia_update.timekey_30_time, htzx_asia_update.downloadsize_by_usetime]
    sorts: [htzx_asia_update.timekey_30_time desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Date: htzx_asia_update.time_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: htzx_asia_update.client_ip
    row: 119
    col: 0
    width: 24
    height: 8
  - name: Data Stat from htzx_asia_update
    type: text
    title_text: Data Stat from htzx_asia_update
    row: 109
    col: 0
    width: 24
    height: 2
  - title: diagtype_4_p90
    name: diagtype_4_p90
    model: zl_asia
    explore: lz_net_dig_test_4
    type: looker_line
    fields: [lz_net_dig_test.timekey_30_time, lz_net_dig_test.pert_90, geo_ip_country_range.country_iso_code]
    pivots: [geo_ip_country_range.country_iso_code]
    sorts: [lz_net_dig_test.timekey_30_time desc, geo_ip_country_range.country_iso_code]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ClientIP: lz_net_dig_test.client_ip
    row: 129
    col: 0
    width: 24
    height: 8
  - title: diagtype_4_p80
    name: diagtype_4_p80
    model: zl_asia
    explore: lz_net_dig_test_4
    type: looker_line
    fields: [lz_net_dig_test.timekey_30_time, geo_ip_country_range.country_iso_code,
      lz_net_dig_test.pert_80]
    pivots: [geo_ip_country_range.country_iso_code]
    sorts: [lz_net_dig_test.timekey_30_time desc, geo_ip_country_range.country_iso_code]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ClientIP: lz_net_dig_test.client_ip
    row: 137
    col: 0
    width: 24
    height: 9
  - name: Diagtype_4_ping-stats
    type: text
    title_text: Diagtype_4_ping-stats
    row: 127
    col: 0
    width: 24
    height: 2
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia
    explore: lz_net_dig_test_1
    listens_to_filters: []
    field: lz_net_dig_test.time_date
  - name: Server Domain Name
    title: Server Domain Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia
    explore: lz_net_dig_test_1
    listens_to_filters: []
    field: lz_net_dig_test.name
  - name: Country
    title: Country
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
  - name: ISP
    title: ISP
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
  - name: Client_ASN
    title: Client_ASN
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
  - name: ClientIP
    title: ClientIP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia
    explore: stat_from_cdn
    listens_to_filters: []
    field: stat_from_cdn.remote_ip
  - name: GCP_PEER_ASN
    title: GCP_PEER_ASN
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
  - name: Show Records Where GCP Hop is the highest
    title: Show Records Where GCP Hop is the highest
    type: number_filter
    default_value: '0'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
