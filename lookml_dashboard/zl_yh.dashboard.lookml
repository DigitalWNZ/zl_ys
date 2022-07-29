- dashboard: zl_yh
  title: zl_yh
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: top_isp
    name: top_isp
    model: zl_asia
    explore: lz_net_dig_test_yh
    type: looker_column
    fields: [lz_net_dig_test.pert_90_yh, geo_ip_isp_range.asn_yh]
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
      ISP: geo_ip_isp_range.isp
      Asn: geo_ip_isp_range.asn
      Country Iso Code: geo_ip_country_range.country_iso_code
      Time Time: lz_net_dig_test.time_time
    row: 0
    col: 0
    width: 24
    height: 10
  - title: cidr_p90
    name: cidr_p90
    model: zl_asia
    explore: lz_net_dig_test_yh
    type: looker_column
    fields: [geo_ip_isp_range.network, lz_net_dig_test.pert_90_yh]
    filters: {}
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
      ISP: geo_ip_isp_range.isp
      Asn: geo_ip_isp_range.asn
      Country Iso Code: geo_ip_country_range.country_iso_code
      Time Time: lz_net_dig_test.time_time
    row: 10
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
    model: zl_asia
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
    model: zl_asia
    explore: lz_net_dig_test_yh
    listens_to_filters: []
    field: geo_ip_country_range.country_iso_code
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
    model: zl_asia
    explore: lz_net_dig_test_yh
    listens_to_filters: []
    field: geo_ip_isp_range.isp
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
    model: zl_asia
    explore: lz_net_dig_test_yh
    listens_to_filters: []
    field: geo_ip_isp_range.asn
