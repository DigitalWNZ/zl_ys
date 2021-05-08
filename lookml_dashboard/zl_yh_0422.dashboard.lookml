- dashboard: zl_yh_0422
  title: zl_yh_0422
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: top_isp
    name: top_isp
    model: zl_asia_0422
    explore: lz_net_dig_test_yh
    type: looker_column
    fields: [lz_net_dig_test.pert_90_yh, geo_ip_isp_mask.asn_yh]
    sorts: [lz_net_dig_test.pert_90_yh desc]
    limit: 500
    query_timezone: UTC
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    hidden_series: ['"Asian Vision" - lz_net_dig_test.pert_90', '"Clear Path Networks"
        - lz_net_dig_test.pert_90', '"Converge ICT" - lz_net_dig_test.pert_90', '"DctecH
        Microservices Incorporated" - lz_net_dig_test.pert_90', '"Dito Telecommunity
        Corp." - lz_net_dig_test.pert_90', '"Globe Telecom" - lz_net_dig_test.pert_90',
      '"Infinivan Incorporated" - lz_net_dig_test.pert_90', '"Philippine Long Distance
        Telephone" - lz_net_dig_test.pert_90', '"RoyalCable Flash" - lz_net_dig_test.pert_90',
      '"Sky Cable" - lz_net_dig_test.pert_90', '"Smart Communications" - lz_net_dig_test.pert_90',
      '"Source Telecoms" - lz_net_dig_test.pert_90', '"Streamtech Systems Technologies"
        - lz_net_dig_test.pert_90', Cloudflare - lz_net_dig_test.pert_90, Converge
        - lz_net_dig_test.pert_90]
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Time Time: lz_net_dig_test.time_time
      Country Iso Code: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
    row: 0
    col: 0
    width: 24
    height: 10
  - title: cidr_p90
    name: cidr_p90
    model: zl_asia_0422
    explore: lz_net_dig_test_yh
    type: looker_column
    fields: [geo_ip_isp_mask.network, lz_net_dig_test.pert_90_yh]
    sorts: [lz_net_dig_test.pert_90_yh desc]
    limit: 500
    query_timezone: UTC
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Time Time: lz_net_dig_test.time_time
      Country Iso Code: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
    row: 10
    col: 0
    width: 24
    height: 9
  - title: delay_gcp_by_metro
    name: delay_gcp_by_metro
    model: zl_asia_0422
    explore: gcp_hop_dive
    type: looker_column
    fields: [gcp_hop_dive.metro, gcp_hop_dive.delay_gcp_95]
    filters: {}
    sorts: [gcp_hop_dive.metro]
    limit: 500
    query_timezone: UTC
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      Diff Asn (Yes / No): gcp_hop_dive.diff_asn
      Time Time: gcp_hop_dive.time_time
      Country Iso Code: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
      Metro: gcp_hop_dive.metro
    row: 37
    col: 0
    width: 24
    height: 8
  - title: delay_gcp_by_country
    name: delay_gcp_by_country
    model: zl_asia_0422
    explore: gcp_hop_dive
    type: looker_column
    fields: [geo_ip_country_mask.country_iso_code, gcp_hop_dive.delay_gcp_95]
    sorts: [gcp_hop_dive.delay_gcp_95 desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    listen:
      Diff Asn (Yes / No): gcp_hop_dive.diff_asn
      Time Time: gcp_hop_dive.time_time
      Country Iso Code: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
      Metro: gcp_hop_dive.metro
    row: 19
    col: 0
    width: 24
    height: 9
  - title: delay_gcp_by_isp
    name: delay_gcp_by_isp
    model: zl_asia_0422
    explore: gcp_hop_dive
    type: looker_column
    fields: [gcp_hop_dive.delay_gcp_95, geo_ip_isp_mask.isp_yh_1]
    sorts: [gcp_hop_dive.delay_gcp_95 desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    defaults_version: 1
    series_types: {}
    listen:
      Diff Asn (Yes / No): gcp_hop_dive.diff_asn
      Time Time: gcp_hop_dive.time_time
      Country Iso Code: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
      Metro: gcp_hop_dive.metro
    row: 28
    col: 0
    width: 24
    height: 9
  - title: Hop_by_id_dive
    name: Hop_by_id_dive
    model: zl_asia_0422
    explore: hop_by_ip_yh
    type: looker_grid
    fields: [geo_ip_country_mask.country_iso_code, geo_ip_isp_mask.isp_yh, geo_ip_isp_mask.asn,
      first_2_Hop.client_ip, first_2_Hop.name, first_2_Hop.User_ID, first_2_Hop.Hop0,
      first_2_Hop.Delay0, first_2_Hop.Hop1, first_2_Hop.Delay1, gcp_hop_dive.hop_gcp,
      gcp_hop_dive.delay_gcp, gcp_hop_dive.gcp_peer_asn, gcp_hop_dive.metro, gcp_hop_dive.diff_asn]
    sorts: [geo_ip_country_mask.country_iso_code]
    limit: 500
    dynamic_fields: [{_kind_hint: dimension, table_calculation: diff_asn, _type_hint: number,
        category: table_calculation, expression: 'if(${geo_ip_isp_mask.asn}!=${gcp_hop_dive.gcp_peer_asn},1,0)',
        label: diff_asn, value_format: !!null '', value_format_name: !!null '', is_disabled: true}]
    query_timezone: UTC
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
    listen:
      Diff Asn (Yes / No): gcp_hop_dive.diff_asn
      Time Time: gcp_hop_dive.time_time
      Country Iso Code: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
      Metro: gcp_hop_dive.metro
    row: 45
    col: 0
    width: 24
    height: 13
  - title: Route Detail
    name: Route Detail
    model: zl_asia_0422
    explore: hop_by_ip_yh_route
    type: looker_grid
    fields: [first_2_Hop.client_ip, geo_ip_country_mask.country_iso_code, geo_ip_isp_mask.isp,
      geo_ip_isp_mask.asn, first_2_Hop.Hop0, first_2_Hop.Delay0, first_2_Hop.Hop1,
      first_2_Hop.Delay1, gcp_hop_dive.hop_gcp, gcp_hop_dive.delay_gcp, first_2_Hop.target,
      gcp_ip_range_mask.country_iso_code, gcp_ip_range_mask.country_city]
    filters:
      gcp_ip_range_mask.network: "-NULL"
    sorts: [first_2_Hop.client_ip]
    limit: 500
    query_timezone: UTC
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
    defaults_version: 1
    listen:
      Time Time: first_2_Hop.time_time
      Country Iso Code: geo_ip_country_mask.country_iso_code
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
      Metro: gcp_hop_dive.metro
      Country Iso Code - Target: gcp_ip_range_mask.country_iso_code
    row: 58
    col: 0
    width: 24
    height: 16
  filters:
  - name: Time Time
    title: Time Time
    type: field_filter
    default_value: 10 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: zl_asia_0422
    explore: lz_net_dig_test_yh
    listens_to_filters: []
    field: lz_net_dig_test.time_time
  - name: Country Iso Code
    title: Country Iso Code
    type: field_filter
    default_value: PH
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: zl_asia_0422
    explore: lz_net_dig_test_yh
    listens_to_filters: []
    field: geo_ip_country_mask.country_iso_code
  - name: ISP
    title: ISP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: zl_asia_0422
    explore: lz_net_dig_test_yh
    listens_to_filters: []
    field: geo_ip_isp_mask.isp
  - name: Asn
    title: Asn
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: zl_asia_0422
    explore: lz_net_dig_test_yh
    listens_to_filters: []
    field: geo_ip_isp_mask.asn
  - name: Metro
    title: Metro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: zl_asia_0422
    explore: gcp_hop_dive
    listens_to_filters: []
    field: gcp_hop_dive.metro
  - name: Diff Asn (Yes / No)
    title: Diff Asn (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
      options: []
    model: zl_asia_0422
    explore: gcp_hop_dive
    listens_to_filters: []
    field: gcp_hop_dive.diff_asn
  - name: Country Iso Code - Target
    title: Country Iso Code - Target
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: zl_asia_0422
    explore: hop_by_ip_yh_route
    listens_to_filters: []
    field: gcp_ip_range_mask.country_iso_code
