# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  parameter: time_gran {
    label: "Time period"
    description: "Time period : Daily, weekly, monthly or overall"
    type: unquoted
    allowed_value: {
      label: "Daily"
      value: "PROD_REPORT.DATA.R_CRM_METRIC_SUMMARY"
    }

    allowed_value: {
      label: "Weekly"
      value: "PROD_REPORT.DATA.R_CRM_METRIC_SUMMARY_WEEKLY"
    }

    allowed_value: {
      label: "Monthly"
      value: "PROD_REPORT.DATA.R_CRM_METRIC_SUMMARY_MONTHLY"
    }
    default_value: "PROD_REPORT.DATA.R_CRM_METRIC_SUMMARY"
  }

  dimension_group: Time_granularity {
    type: time
    label: "Time granularity"
    timeframes: [date, week, month]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: column1 {
    hidden: no
    label: "Column 1"
    label_from_parameter: time_gran
    group_label: "Parameter Column"
    type: string
    sql:
    {% if time_gran._parameter_value == "PROD_REPORT.DATA.R_CRM_METRIC_SUMMARY"%} ${Time_granularity_date}
    {% elsif time_gran._parameter_value == "PROD_REPORT.DATA.R_CRM_METRIC_SUMMARY_MONTHLY"%} ${Time_granularity_month}
    {% elsif time_gran._parameter_value == "PROD_REPORT.DATA.R_CRM_METRIC_SUMMARY_WEEKLY"%} ${Time_granularity_week}
    {%else%} NULL
    {% endif %};;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  measure: sale_measure {
    type: number
    sql: ${sale_price} ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
  }

  measure: div_test {
    type:  number
    label: "The Div Test"
    sql: ${total_sale_price}/${average_sale_price} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, Time_granularity_date]
  }


}
