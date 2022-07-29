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
    row: 95
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
        desc, geo_ip_country_range.country_name]
    limit: 5000
    total: true
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
    hidden_series: [AU - Australia - lz_net_dig_test.lost_rate, BY - Belarus - lz_net_dig_test.lost_rate,
      CA - Canada - lz_net_dig_test.lost_rate, DE - Germany - lz_net_dig_test.lost_rate,
      FR - France - lz_net_dig_test.lost_rate, GB - "United Kingdom" - lz_net_dig_test.lost_rate,
      HK - "Hong Kong" - lz_net_dig_test.lost_rate, IL - Israel - lz_net_dig_test.lost_rate,
      IQ - Iraq - lz_net_dig_test.lost_rate, JP - Japan - lz_net_dig_test.lost_rate,
      KE - Kenya - lz_net_dig_test.lost_rate, KH - Cambodia - lz_net_dig_test.lost_rate,
      KR - "South Korea" - lz_net_dig_test.lost_rate, LA - Laos - lz_net_dig_test.lost_rate,
      MM - Myanmar - lz_net_dig_test.lost_rate, MO - Macao - lz_net_dig_test.lost_rate,
      MY - Malaysia - lz_net_dig_test.lost_rate, PH - Philippines - lz_net_dig_test.lost_rate,
      PL - Poland - lz_net_dig_test.lost_rate, SA - "Saudi Arabia" - lz_net_dig_test.lost_rate,
      SG - Singapore - lz_net_dig_test.lost_rate, TH - Thailand - lz_net_dig_test.lost_rate,
      TW - Taiwan - lz_net_dig_test.lost_rate, US - "United States" - lz_net_dig_test.lost_rate,
      UY - Uruguay - lz_net_dig_test.lost_rate, VN - Vietnam - lz_net_dig_test.lost_rate]
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
    row: 81
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
    row: 105
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
    row: 93
    col: 0
    width: 24
    height: 2
  - name: Ping  and Trace Detail By IP
    type: text
    title_text: Ping  and Trace Detail By IP
    row: 103
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
    row: 180
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
    row: 170
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
    row: 177
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
    row: 177
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
  - title: pert95_by_country_v1
    name: pert95_by_country_v1
    model: zl_asia
    explore: lz_net_dig_test_2
    type: looker_line
    fields: [lz_net_dig_test.timekey_30_time, geo_ip_country_range.country_iso_code,
      geo_ip_country_range.country_name, lz_net_dig_test.pert_95]
    pivots: [geo_ip_country_range.country_iso_code, geo_ip_country_range.country_name]
    sorts: [lz_net_dig_test.timekey_30_time desc, geo_ip_country_range.country_iso_code,
      geo_ip_country_range.country_name]
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
    defaults_version: 1
    series_types: {}
    hidden_series: [AU - Australia - lz_net_dig_test.pert_95, BY - Belarus - lz_net_dig_test.pert_95,
      CA - Canada - lz_net_dig_test.pert_95, DE - Germany - lz_net_dig_test.pert_95,
      FR - France - lz_net_dig_test.pert_95, GB - "United Kingdom" - lz_net_dig_test.pert_95,
      HK - "Hong Kong" - lz_net_dig_test.pert_95, IL - Israel - lz_net_dig_test.pert_95,
      IQ - Iraq - lz_net_dig_test.pert_95, JP - Japan - lz_net_dig_test.pert_95, KE
        - Kenya - lz_net_dig_test.pert_95, KH - Cambodia - lz_net_dig_test.pert_95,
      KR - "South Korea" - lz_net_dig_test.pert_95, LA - Laos - lz_net_dig_test.pert_95,
      MM - Myanmar - lz_net_dig_test.pert_95, MO - Macao - lz_net_dig_test.pert_95,
      MY - Malaysia - lz_net_dig_test.pert_95, PH - Philippines - lz_net_dig_test.pert_95,
      PL - Poland - lz_net_dig_test.pert_95, SA - "Saudi Arabia" - lz_net_dig_test.pert_95,
      SG - Singapore - lz_net_dig_test.pert_95, TH - Thailand - lz_net_dig_test.pert_95,
      TW - Taiwan - lz_net_dig_test.pert_95, US - "United States" - lz_net_dig_test.pert_95,
      UY - Uruguay - lz_net_dig_test.pert_95, VN - Vietnam - lz_net_dig_test.pert_95]
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: lz_net_dig_test.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 49
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
    sorts: [lz_net_dig_test.timekey_30_time desc, geo_ip_country_range.country_iso_code,
      geo_ip_country_range.country_name]
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
    defaults_version: 1
    series_types: {}
    hidden_series: [AU - Australia - lz_net_dig_test.pert_80, CA - Canada - lz_net_dig_test.pert_80,
      DE - Germany - lz_net_dig_test.pert_80, FR - France - lz_net_dig_test.pert_80,
      GB - "United Kingdom" - lz_net_dig_test.pert_80, HK - "Hong Kong" - lz_net_dig_test.pert_80,
      IL - Israel - lz_net_dig_test.pert_80, IQ - Iraq - lz_net_dig_test.pert_80,
      JP - Japan - lz_net_dig_test.pert_80, KE - Kenya - lz_net_dig_test.pert_80,
      KH - Cambodia - lz_net_dig_test.pert_80, KR - "South Korea" - lz_net_dig_test.pert_80,
      LA - Laos - lz_net_dig_test.pert_80, MM - Myanmar - lz_net_dig_test.pert_80,
      MO - Macao - lz_net_dig_test.pert_80, MY - Malaysia - lz_net_dig_test.pert_80,
      PH - Philippines - lz_net_dig_test.pert_80, PL - Poland - lz_net_dig_test.pert_80,
      SA - "Saudi Arabia" - lz_net_dig_test.pert_80, SG - Singapore - lz_net_dig_test.pert_80,
      TH - Thailand - lz_net_dig_test.pert_80, TW - Taiwan - lz_net_dig_test.pert_80,
      US - "United States" - lz_net_dig_test.pert_80, UY - Uruguay - lz_net_dig_test.pert_80,
      VN - Vietnam - lz_net_dig_test.pert_80, BY - Belarus - lz_net_dig_test.pert_80]
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 61
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
    row: 81
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
    row: 81
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
    row: 73
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
    height: 14
  - title: ping_interval_by_country
    name: ping_interval_by_country
    model: zl_asia
    explore: lz_net_dig_test_1
    type: looker_column
    fields: [lz_net_dig_test.average_interval, geo_ip_country_range.country_iso_code,
      lz_net_dig_test.valid_count]
    pivots: [geo_ip_country_range.country_iso_code]
    fill_fields: [lz_net_dig_test.average_interval]
    filters: {}
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
    hidden_series: [AU - lz_net_dig_test.valid_count, BY - lz_net_dig_test.valid_count,
      CA - lz_net_dig_test.valid_count, DE - lz_net_dig_test.valid_count, FR - lz_net_dig_test.valid_count,
      GB - lz_net_dig_test.valid_count, IL - lz_net_dig_test.valid_count, IQ - lz_net_dig_test.valid_count,
      JP - lz_net_dig_test.valid_count, KE - lz_net_dig_test.valid_count, KH - lz_net_dig_test.valid_count,
      KR - lz_net_dig_test.valid_count, LA - lz_net_dig_test.valid_count, MM - lz_net_dig_test.valid_count,
      MO - lz_net_dig_test.valid_count, MY - lz_net_dig_test.valid_count, PH - lz_net_dig_test.valid_count,
      PL - lz_net_dig_test.valid_count, SA - lz_net_dig_test.valid_count, SG - lz_net_dig_test.valid_count,
      TH - lz_net_dig_test.valid_count, TW - lz_net_dig_test.valid_count, US - lz_net_dig_test.valid_count,
      UY - lz_net_dig_test.valid_count, VN - lz_net_dig_test.valid_count]
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
  - title: pos_status_by_country_30m
    name: pos_status_by_country_30m
    model: zl_asia
    explore: htzx_asia_update
    type: looker_line
    fields: [htzx_asia_update.timekey_30_time, htzx_asia_update.count_status_1, geo_ip_country_range.country_iso_code]
    pivots: [geo_ip_country_range.country_iso_code]
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
    row: 113
    col: 0
    width: 24
    height: 8
  - title: download_speed_by_country_30m
    name: download_speed_by_country_30m
    model: zl_asia
    explore: htzx_asia_update
    type: looker_line
    fields: [htzx_asia_update.timekey_30_time, geo_ip_country_range.country_iso_code,
      htzx_asia_update.avg_download_speed]
    pivots: [geo_ip_country_range.country_iso_code]
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
    row: 131
    col: 0
    width: 24
    height: 9
  - name: Data Stat from htzx_asia_update
    type: text
    title_text: Data Stat from htzx_asia_update
    row: 121
    col: 0
    width: 24
    height: 2
  - title: diagtype_4_p95
    name: diagtype_4_p95
    model: zl_asia
    explore: lz_net_dig_test_4
    type: looker_line
    fields: [lz_net_dig_test.timekey_30_time, geo_ip_country_range.country_iso_code,
      lz_net_dig_test.pert_95]
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
    row: 151
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
    row: 161
    col: 0
    width: 24
    height: 9
  - name: Diagtype_4_ping-stats
    type: text
    title_text: Diagtype_4_ping-stats
    row: 159
    col: 0
    width: 24
    height: 2
  - title: pos_status_by_isp_30m
    name: pos_status_by_isp_30m
    model: zl_asia
    explore: htzx_asia_update
    type: looker_line
    fields: [htzx_asia_update.count_status_1, htzx_asia_update.timekey_30_time, geo_ip_isp_range.isp]
    pivots: [geo_ip_isp_range.isp]
    sorts: [htzx_asia_update.timekey_30_time desc, geo_ip_isp_range.isp]
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
      Date: htzx_asia_update.time_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: htzx_asia_update.client_ip
    row: 123
    col: 0
    width: 24
    height: 8
  - title: download_speed_by_isp_30m
    name: download_speed_by_isp_30m
    model: zl_asia
    explore: htzx_asia_update
    type: looker_line
    fields: [htzx_asia_update.avg_download_speed, htzx_asia_update.timekey_30_time,
      geo_ip_isp_range.isp]
    pivots: [geo_ip_isp_range.isp]
    sorts: [htzx_asia_update.timekey_30_time desc, geo_ip_isp_range.isp]
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
    defaults_version: 1
    listen:
      Date: htzx_asia_update.time_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: htzx_asia_update.client_ip
    row: 140
    col: 0
    width: 24
    height: 11
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
