- dashboard: zl_asia_cdn_0422
  title: zl_asia_cdn_0422
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Request by Metro
    name: Request by Metro
    model: zl_asia_0422
    explore: cdn_transform
    type: looker_pie
    fields: [cdn_transform.metro, cdn_transform.count]
    sorts: [cdn_transform.count desc]
    limit: 20
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 33
    col: 0
    width: 8
    height: 7
  - title: Hit Rate by Metro
    name: Hit Rate by Metro
    model: zl_asia_0422
    explore: cdn_transform_base
    type: looker_grid
    fields: [cdn_transform.metro, cdn_transform.real_hit_rate_filtered, cdn_transform.expect_hit_rate_filtered,
      cdn_transform.count_filtered, cdn_transform.count_hit_filtered, cdn_transform.count_distinct_url_filtered]
    sorts: [cdn_transform.real_hit_rate_filtered desc]
    limit: 500
    column_limit: 50
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      cdn_transform.real_hit_rate_filtered:
        is_active: true
      cdn_transform.expect_hit_rate_filtered:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      cdn_transform.count_filtered:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      cdn_transform.count_hit_filtered:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      cdn_transform.count_distinct_url_filtered:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
    defaults_version: 1
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 59
    col: 0
    width: 24
    height: 12
  - title: Latency by Metro
    name: Latency by Metro
    model: zl_asia_0422
    explore: cdn_transform
    type: looker_grid
    fields: [cdn_transform.metro, cdn_transform.latency_p50, cdn_transform.latency_p90,
      cdn_transform.latency_p95, cdn_transform.latency_p99]
    sorts: [cdn_transform.latency_p50 desc]
    limit: 500
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      cdn_transform.latency_p50:
        is_active: true
      cdn_transform.latency_p90:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      cdn_transform.latency_p95:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      cdn_transform.latency_p99:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
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
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 73
    col: 0
    width: 24
    height: 9
  - title: Latency by Time
    name: Latency by Time
    model: zl_asia_0422
    explore: cdn_transform_base
    type: looker_area
    fields: [cdn_transform.latency_p50, cdn_transform.latency_p90, cdn_transform.latency_p95,
      cdn_transform.latency_p99, cdn_transform.timekey_min]
    sorts: [cdn_transform.latency_p50 desc]
    limit: 500
    column_limit: 50
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
      "# of minutes": cdn_transform.num_of_minutes
    row: 82
    col: 0
    width: 24
    height: 13
  - title: Hit Rate by Time
    name: Hit Rate by Time
    model: zl_asia_0422
    explore: cdn_transform_base
    type: looker_area
    fields: [cdn_transform.timekey_min, cdn_transform.real_hit_rate_filtered]
    sorts: [cdn_transform.timekey_min desc]
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
      "# of minutes": cdn_transform.num_of_minutes
    row: 49
    col: 0
    width: 24
    height: 10
  - title: Client Heat Map
    name: Client Heat Map
    model: zl_asia_0422
    explore: cdn_transform
    type: looker_map
    fields: [cdn_transform.count_distinct_remote_ip, geo_ip_country_mask.country_iso_code]
    sorts: [cdn_transform.count_distinct_remote_ip desc]
    limit: 500
    query_timezone: UTC
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: false
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 45.1510532655634
    map_longitude: 7.722015380859376
    map_zoom: 3
    series_types: {}
    defaults_version: 1
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 4
    col: 0
    width: 24
    height: 10
  - title: Request by Status
    name: Request by Status
    model: zl_asia_0422
    explore: cdn_transform_base
    type: looker_column
    fields: [cdn_transform.timekey_min, cdn_transform.status_tier, cdn_transform.count]
    pivots: [cdn_transform.status_tier]
    fill_fields: [cdn_transform.status_tier]
    sorts: [cdn_transform.status_tier, cdn_transform.timekey_min]
    limit: 100
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
    defaults_version: 1
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 24
    col: 0
    width: 24
    height: 9
  - title: Top URL
    name: Top URL
    model: zl_asia_0422
    explore: cdn_transform
    type: looker_bar
    fields: [cdn_transform.request_url, cdn_transform.count]
    sorts: [cdn_transform.count desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: cdn_transform.count,
            id: cdn_transform.count, name: Cdn Transform}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hide_legend: false
    series_types: {}
    defaults_version: 1
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 40
    col: 16
    width: 8
    height: 7
  - title: Request by Protocal
    name: Request by Protocal
    model: zl_asia_0422
    explore: cdn_transform
    type: looker_pie
    fields: [cdn_transform.request_protocal, cdn_transform.count]
    sorts: [cdn_transform.count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    series_types: {}
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 40
    col: 0
    width: 8
    height: 7
  - title: Response Size vs Cache Fill Size
    name: Response Size vs Cache Fill Size
    model: zl_asia_0422
    explore: cdn_transform_base
    type: looker_column
    fields: [cdn_transform.timekey_min, cdn_transform.sum_non_cache_fill_filtered,
      cdn_transform.sum_cache_fill_filtered]
    sorts: [cdn_transform.sum_non_cache_fill_filtered desc]
    limit: 100
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
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 14
    col: 0
    width: 24
    height: 10
  - title: Request by Cacheid
    name: Request by Cacheid
    model: zl_asia_0422
    explore: cdn_transform
    type: looker_pie
    fields: [cdn_transform.cacheid, cdn_transform.count]
    sorts: [cdn_transform.count desc]
    limit: 20
    query_timezone: UTC
    value_labels: legend
    label_type: labPer
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
    series_types: {}
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 33
    col: 8
    width: 8
    height: 7
  - title: Request by ASN
    name: Request by ASN
    model: zl_asia_0422
    explore: cdn_transform
    type: looker_pie
    fields: [cdn_transform.count, geo_ip_isp_mask.asn]
    sorts: [cdn_transform.count desc]
    limit: 20
    query_timezone: UTC
    value_labels: legend
    label_type: labPer
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
    series_types: {}
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 33
    col: 16
    width: 8
    height: 7
  - title: Request by Extension
    name: Request by Extension
    model: zl_asia_0422
    explore: cdn_transform_base
    type: looker_pie
    fields: [cdn_transform.count, cdn_transform.request_extension]
    sorts: [cdn_transform.count desc]
    limit: 500
    query_timezone: UTC
    value_labels: legend
    label_type: labPer
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
    series_types: {}
    listen:
      time: cdn_transform.timestamp_time
      Metro: cdn_transform.metro
      CacheID: cdn_transform.cacheid
      asn: geo_ip_isp_mask.asn
      url: cdn_transform.request_url
    row: 40
    col: 8
    width: 8
    height: 7
  - name: "<span class='fa fa-globe'> Overall Demographic Information </span>"
    type: text
    title_text: "<span class='fa fa-globe'> Overall Demographic Information </span>"
    subtitle_text: "<p> Request distribution by various dimension</p>"
    row: 2
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-fire'> Hit Rate Analysis </span>"
    type: text
    title_text: "<span class='fa fa-fire'> Hit Rate Analysis </span>"
    subtitle_text: "<p>Is the cache working effectively? </p>"
    row: 47
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-car''> Latency Analysis </span>"
    type: text
    title_text: "<span class='fa fa-car''> Latency Analysis </span>"
    subtitle_text: "<p>How is the network speed? </p>"
    row: 71
    col: 0
    width: 24
    height: 2
  filters:
  - name: time
    title: time
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia_0422
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.timestamp_time
  - name: Metro
    title: Metro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia_0422
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.metro
  - name: CacheID
    title: CacheID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia_0422
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.cacheid
  - name: asn
    title: asn
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia_0422
    explore: cdn_transform
    listens_to_filters: []
    field: geo_ip_isp_mask.asn
  - name: url
    title: url
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia_0422
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.request_url
  - name: "# of minutes"
    title: "# of minutes"
    type: field_filter
    default_value: '15'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: zl_asia_0422
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.num_of_minutes
