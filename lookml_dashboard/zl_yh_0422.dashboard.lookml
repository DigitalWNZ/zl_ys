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
    filters:
      lz_net_dig_test.timekey_time: 5 days
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
      Country Iso Code: geo_ip_country_mask.country_iso_code
      Time Time: lz_net_dig_test.time_time
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
      Country Iso Code: geo_ip_country_mask.country_iso_code
      Time Time: lz_net_dig_test.time_time
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
      Country Iso Code: geo_ip_country_mask.country_iso_code
      Time Time: gcp_hop_dive.time
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
      Country Iso Code: geo_ip_country_mask.country_iso_code
      Time Time: gcp_hop_dive.time
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
      Country Iso Code: geo_ip_country_mask.country_iso_code
      Time Time: gcp_hop_dive.time
      ISP: geo_ip_isp_mask.isp
      Asn: geo_ip_isp_mask.asn
      Metro: gcp_hop_dive.metro
    row: 28
    col: 0
    width: 24
    height: 9
  filters:
  - name: Time Time
    title: Time Time
    type: field_filter
    default_value: 5 day
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
