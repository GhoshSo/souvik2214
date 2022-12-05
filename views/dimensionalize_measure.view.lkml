view: dimensionalize_measure {
  derived_table: {
    sql: SELECT
          users.id  AS `users.id`,
          users.state  AS `users.state`,
          COALESCE(SUM(order_items.sale_price ), 0) AS `order_items.total_sale_price`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
      GROUP BY
          1,
          2
      ORDER BY
          COALESCE(SUM(order_items.sale_price ), 0) DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.`users.id` ;;
  }

  dimension: users_state {
    type: string
    sql: ${TABLE}.`users.state` ;;
  }
###
  dimension: order_items_total_sale_price {
    type: number
    sql: ${TABLE}.`order_items.total_sale_price` ;;
  }

  set: detail {
    fields: [users_id, users_state, order_items_total_sale_price]
  }
}
