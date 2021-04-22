- dashboard: zl_asia_2_0422
  title: zl_ASIA_2_0422
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: hop_by_ip
    name: hop_by_ip
    model: zl_asia_0422
    explore: hop_by_ip
    type: looker_grid
    fields: [geo_ip_country_mask.country_iso_code, geo_ip_isp_mask.isp, geo_ip_isp_mask.asn,
      first_2_Hop.client_ip, gcp_hop.name, first_2_Hop.User_ID, first_2_Hop.Hop0,
      first_2_Hop.Delay0, first_2_Hop.Hop1, first_2_Hop.Delay1, gcp_hop.hop_gcp, gcp_hop.delay_gcp,
      gcp_hop.gcp_peer_asn, gcp_hop.max_delay_hop, gcp_hop.max_delay, gcp_hop.gcp_max,
      gcp_hop.Metro, asn_diff]
    filters:
      gcp_hop.client_ip: ''
    sorts: [first_2_Hop.client_ip desc]
    limit: 5000
    dynamic_fields: [{dimension: asn_diff, label: ASN_DIFF, expression: 'if(${geo_ip_isp_mask.asn}!=${gcp_hop.gcp_peer_asn},1,0)',
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
      Country: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Client_ASN: geo_ip_isp_mask.asn
      ClientIP: first_2_Hop.client_ip
      GCP_PEER_ASN: gcp_hop.gcp_peer_asn
      Show Records Where GCP Hop is the highest: gcp_hop.gcp_max
    row: 10
    col: 0
    width: 24
    height: 8
  - title: ping_by_ip
    name: ping_by_ip
    model: zl_asia_0422
    explore: lz_net_dig_test_1
    type: looker_grid
    fields: [geo_ip_country_mask.country_iso_code, geo_ip_isp_mask.isp, geo_ip_isp_mask.asn,
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
      Country: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Client_ASN: geo_ip_isp_mask.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 20
    col: 0
    width: 24
    height: 8
  - name: Hop By ISP
    type: text
    title_text: Hop By ISP
    row: 8
    col: 0
    width: 24
    height: 2
  - name: Ping  and Trace Detail By IP
    type: text
    title_text: Ping  and Trace Detail By IP
    row: 18
    col: 0
    width: 24
    height: 2
  - title: Raw Ping Data
    name: Raw Ping Data
    model: zl_asia_0422
    explore: lz_net_dig_test_1
    type: looker_grid
    fields: [geo_ip_country_mask.country_iso_code, geo_ip_isp_mask.isp, geo_ip_isp_mask.asn,
      lz_net_dig_test.client_ip, lz_net_dig_test.name, lz_net_dig_test.user_id, lz_net_dig_test.average]
    filters:
      lz_net_dig_test.isp: ''
    sorts: [geo_ip_isp_mask.asn]
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
      Country: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Client_ASN: geo_ip_isp_mask.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 0
    col: 0
    width: 24
    height: 8
  - title: Raw_data_ping_1000plus
    name: Raw_data_ping_1000plus
    model: zl_asia_0422
    explore: lz_net_dig_test_2_1000_plus
    type: looker_grid
    fields: [geo_ip_country_mask.country_iso_code, geo_ip_isp_mask.isp, geo_ip_isp_mask.asn,
      lz_net_dig_test.client_ip, lz_net_dig_test.name, lz_net_dig_test.user_id, lz_net_dig_test.average,
      lz_net_dig_test.diagtype]
    sorts: [geo_ip_country_mask.country_iso_code]
    limit: 500
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
    series_types: {}
    defaults_version: 1
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Client_ASN: geo_ip_isp_mask.asn
      ClientIP: lz_net_dig_test.client_ip
    row: 99
    col: 0
    width: 24
    height: 7
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
    model: zl_asia_0422
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
    model: zl_asia_0422
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
    model: zl_asia_0422
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
