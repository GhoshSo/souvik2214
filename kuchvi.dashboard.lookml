- dashboard: my_dash_for_checking_date_granularity
  title: My Dash for Checking Date Granularity
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: isD80JzrG5IlM2cCozYjem
  elements:
  - title: New Tile
    name: New Tile
    model: souvik2214
    explore: order_items
    type: looker_grid
    fields: [order_items.column1, order_items.count]
    filters:
      order_items.time_gran: PROD^_REPORT.DATA.R^_CRM^_METRIC^_SUMMARY^_WEEKLY
    sorts: [order_items.count desc 0]
    limit: 500
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
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
  - title: New Tile 2
    name: New Tile 2
    model: souvik2214
    explore: order_items
    type: looker_grid
    fields: [order_items.column1, order_items.total_sale_price]
    filters:
      order_items.time_gran: PROD^_REPORT.DATA.R^_CRM^_METRIC^_SUMMARY^_MONTHLY
    sorts: [order_items.total_sale_price desc 0]
    limit: 500
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
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
