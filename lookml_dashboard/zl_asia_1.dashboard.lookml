- dashboard: zl_asia_1
  title: zl_ASIA_1
  layout: newspaper
  preferred_viewer: dashboards
  elements:
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
      IQ - Iraq - lz_net_dig_test.lost_rate, KE - Kenya - lz_net_dig_test.lost_rate,
      KH - Cambodia - lz_net_dig_test.lost_rate, KR - "South Korea" - lz_net_dig_test.lost_rate,
      LA - Laos - lz_net_dig_test.lost_rate, MM - Myanmar - lz_net_dig_test.lost_rate,
      MO - Macao - lz_net_dig_test.lost_rate, MY - Malaysia - lz_net_dig_test.lost_rate,
      PH - Philippines - lz_net_dig_test.lost_rate, PL - Poland - lz_net_dig_test.lost_rate,
      SA - "Saudi Arabia" - lz_net_dig_test.lost_rate, SG - Singapore - lz_net_dig_test.lost_rate,
      TH - Thailand - lz_net_dig_test.lost_rate, TW - Taiwan - lz_net_dig_test.lost_rate,
      US - "United States" - lz_net_dig_test.lost_rate, UY - Uruguay - lz_net_dig_test.lost_rate,
      VN - Vietnam - lz_net_dig_test.lost_rate, CN - China - lz_net_dig_test.lost_rate,
      ID - Indonesia - lz_net_dig_test.lost_rate, IN - India - lz_net_dig_test.lost_rate,
      BE - Belgium - lz_net_dig_test.lost_rate]
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
    row: 73
    col: 16
    width: 8
    height: 12
  - name: Ping Statistic By Country and Time
    type: text
    title_text: Ping Statistic By Country and Time
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
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
      IQ - Iraq - lz_net_dig_test.pert_95, KE - Kenya - lz_net_dig_test.pert_95, KH
        - Cambodia - lz_net_dig_test.pert_95, KR - "South Korea" - lz_net_dig_test.pert_95,
      LA - Laos - lz_net_dig_test.pert_95, MM - Myanmar - lz_net_dig_test.pert_95,
      MO - Macao - lz_net_dig_test.pert_95, MY - Malaysia - lz_net_dig_test.pert_95,
      PH - Philippines - lz_net_dig_test.pert_95, PL - Poland - lz_net_dig_test.pert_95,
      SA - "Saudi Arabia" - lz_net_dig_test.pert_95, SG - Singapore - lz_net_dig_test.pert_95,
      TH - Thailand - lz_net_dig_test.pert_95, TW - Taiwan - lz_net_dig_test.pert_95,
      US - "United States" - lz_net_dig_test.pert_95, UY - Uruguay - lz_net_dig_test.pert_95,
      VN - Vietnam - lz_net_dig_test.pert_95, IN - India - lz_net_dig_test.pert_95,
      ID - Indonesia - lz_net_dig_test.pert_95, CN - China - lz_net_dig_test.pert_95]
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
      KE - Kenya - lz_net_dig_test.pert_80, KH - Cambodia - lz_net_dig_test.pert_80,
      KR - "South Korea" - lz_net_dig_test.pert_80, LA - Laos - lz_net_dig_test.pert_80,
      MM - Myanmar - lz_net_dig_test.pert_80, MO - Macao - lz_net_dig_test.pert_80,
      MY - Malaysia - lz_net_dig_test.pert_80, PH - Philippines - lz_net_dig_test.pert_80,
      PL - Poland - lz_net_dig_test.pert_80, SA - "Saudi Arabia" - lz_net_dig_test.pert_80,
      SG - Singapore - lz_net_dig_test.pert_80, TH - Thailand - lz_net_dig_test.pert_80,
      TW - Taiwan - lz_net_dig_test.pert_80, US - "United States" - lz_net_dig_test.pert_80,
      UY - Uruguay - lz_net_dig_test.pert_80, VN - Vietnam - lz_net_dig_test.pert_80,
      BY - Belarus - lz_net_dig_test.pert_80, CN - China - lz_net_dig_test.pert_80,
      ID - Indonesia - lz_net_dig_test.pert_80, IN - India - lz_net_dig_test.pert_80]
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
    row: 73
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
    row: 73
    col: 8
    width: 8
    height: 12
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
      KE - lz_net_dig_test.valid_count, KH - lz_net_dig_test.valid_count, KR - lz_net_dig_test.valid_count,
      LA - lz_net_dig_test.valid_count, MM - lz_net_dig_test.valid_count, MO - lz_net_dig_test.valid_count,
      MY - lz_net_dig_test.valid_count, PH - lz_net_dig_test.valid_count, PL - lz_net_dig_test.valid_count,
      SA - lz_net_dig_test.valid_count, SG - lz_net_dig_test.valid_count, TH - lz_net_dig_test.valid_count,
      TW - lz_net_dig_test.valid_count, US - lz_net_dig_test.valid_count, UY - lz_net_dig_test.valid_count,
      VN - lz_net_dig_test.valid_count, ID - lz_net_dig_test.valid_count, CN - lz_net_dig_test.valid_count,
      IN - lz_net_dig_test.valid_count]
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
    sorts: [htzx_asia_update.timekey_30_time desc, geo_ip_country_range.country_iso_code]
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
    hidden_series: [AU - htzx_asia_update.count_status_1, BY - htzx_asia_update.count_status_1,
      CA - htzx_asia_update.count_status_1, CN - htzx_asia_update.count_status_1,
      HK - htzx_asia_update.count_status_1, ID - htzx_asia_update.count_status_1,
      IL - htzx_asia_update.count_status_1, IQ - htzx_asia_update.count_status_1,
      KE - htzx_asia_update.count_status_1, KR - htzx_asia_update.count_status_1,
      LA - htzx_asia_update.count_status_1, MM - htzx_asia_update.count_status_1,
      MO - htzx_asia_update.count_status_1, MY - htzx_asia_update.count_status_1,
      PH - htzx_asia_update.count_status_1, PL - htzx_asia_update.count_status_1,
      SG - htzx_asia_update.count_status_1, TH - htzx_asia_update.count_status_1,
      TW - htzx_asia_update.count_status_1, US - htzx_asia_update.count_status_1,
      VN - htzx_asia_update.count_status_1]
    listen:
      Date: htzx_asia_update.time_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: htzx_asia_update.client_ip
    row: 87
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
    sorts: [htzx_asia_update.timekey_30_time desc, geo_ip_country_range.country_iso_code]
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
    hidden_series: [AU - htzx_asia_update.avg_download_speed, BY - htzx_asia_update.avg_download_speed,
      CA - htzx_asia_update.avg_download_speed, CN - htzx_asia_update.avg_download_speed,
      HK - htzx_asia_update.avg_download_speed, ID - htzx_asia_update.avg_download_speed,
      IL - htzx_asia_update.avg_download_speed, IQ - htzx_asia_update.avg_download_speed,
      KE - htzx_asia_update.avg_download_speed, KR - htzx_asia_update.avg_download_speed,
      LA - htzx_asia_update.avg_download_speed, MM - htzx_asia_update.avg_download_speed,
      MO - htzx_asia_update.avg_download_speed, MY - htzx_asia_update.avg_download_speed,
      PH - htzx_asia_update.avg_download_speed, PL - htzx_asia_update.avg_download_speed,
      SG - htzx_asia_update.avg_download_speed, TH - htzx_asia_update.avg_download_speed,
      TW - htzx_asia_update.avg_download_speed, US - htzx_asia_update.avg_download_speed,
      VN - htzx_asia_update.avg_download_speed]
    listen:
      Date: htzx_asia_update.time_date
      Country: geo_ip_country_range.country_iso_code
      ISP: geo_ip_isp_range.isp
      Client_ASN: geo_ip_isp_range.asn
      ClientIP: htzx_asia_update.client_ip
    row: 105
    col: 0
    width: 24
    height: 9
  - name: Data Stat from htzx_asia_update
    type: text
    title_text: Data Stat from htzx_asia_update
    row: 85
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
    hidden_series: [AU - lz_net_dig_test.pert_95, BY - lz_net_dig_test.pert_95, CN
        - lz_net_dig_test.pert_95, HK - lz_net_dig_test.pert_95, ID - lz_net_dig_test.pert_95,
      KR - lz_net_dig_test.pert_95, MY - lz_net_dig_test.pert_95, TH - lz_net_dig_test.pert_95,
      TW - lz_net_dig_test.pert_95, US - lz_net_dig_test.pert_95, VN - lz_net_dig_test.pert_95]
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ClientIP: lz_net_dig_test.client_ip
    row: 127
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
    hidden_series: [AU - lz_net_dig_test.pert_80, BY - lz_net_dig_test.pert_80, CN
        - lz_net_dig_test.pert_80, HK - lz_net_dig_test.pert_80, ID - lz_net_dig_test.pert_80,
      KR - lz_net_dig_test.pert_80, MY - lz_net_dig_test.pert_80, TH - lz_net_dig_test.pert_80,
      TW - lz_net_dig_test.pert_80, US - lz_net_dig_test.pert_80, VN - lz_net_dig_test.pert_80]
    listen:
      Date: lz_net_dig_test.time_date
      Server Domain Name: lz_net_dig_test.name
      Country: geo_ip_country_range.country_iso_code
      ClientIP: lz_net_dig_test.client_ip
    row: 135
    col: 0
    width: 24
    height: 9
  - name: Diagtype_4_ping-stats
    type: text
    title_text: Diagtype_4_ping-stats
    row: 125
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
    row: 95
    col: 0
    width: 24
    height: 10
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
    row: 114
    col: 0
    width: 24
    height: 11
  - title: average among 95
    name: average among 95
    model: zl_asia
    explore: lz_net_dig_test_4_above_95
    type: looker_line
    fields: [lz_net_dig_test_4_above_95.geo_ip_country_range_country_iso_code, lz_net_dig_test_4_above_95.lz_net_dig_test_timekey_30_time,
      lz_net_dig_test_4_above_95.avg_average]
    pivots: [lz_net_dig_test_4_above_95.geo_ip_country_range_country_iso_code]
    sorts: [lz_net_dig_test_4_above_95.geo_ip_country_range_country_iso_code 0, lz_net_dig_test_4_above_95.lz_net_dig_test_timekey_30_time
        desc]
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
    hidden_series: [CN - lz_net_dig_test_4_above_95.avg_average, HK - lz_net_dig_test_4_above_95.avg_average,
      ID - lz_net_dig_test_4_above_95.avg_average, KR - lz_net_dig_test_4_above_95.avg_average,
      MY - lz_net_dig_test_4_above_95.avg_average, TH - lz_net_dig_test_4_above_95.avg_average,
      TW - lz_net_dig_test_4_above_95.avg_average, US - lz_net_dig_test_4_above_95.avg_average,
      VN - lz_net_dig_test_4_above_95.avg_average, AU - lz_net_dig_test_4_above_95.avg_average]
    listen:
      Date: lz_net_dig_test_4_above_95.time_date
      Country: lz_net_dig_test_4_above_95.geo_ip_country_range_country_iso_code
      ClientIP: lz_net_dig_test_4_above_95.client_ip
    row: 144
    col: 0
    width: 24
    height: 10
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
