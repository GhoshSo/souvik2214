- dashboard: filter_bar_issue_check
  title: Filter_Bar_Issue Check
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  filters_bar_collapsed: true
  filters_location_top: false
  preferred_slug: bssKu1tFXjknxYl4YFWIA0
  elements:
  - title: New_Tile
    name: New_Tile
    model: souvik2214
    explore: users
    type: table
    fields: [users.gender, users.state, users.zip, users.average_age, users.count,
      users.total_age]
    sorts: [users.average_age desc]
    limit: 500
    query_timezone: America/New_York
    listen:
      State: users.state
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: Delaware
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: souvik2214
    explore: users
    listens_to_filters: []
    field: users.state
