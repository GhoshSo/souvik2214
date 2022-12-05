view: sql_runner_query {
  derived_table: {
    datagroup_trigger: souvik2214_default_datagroup
    sql: SELECT
          users.state  AS `users.state`,
              AVG(users.age ) / COUNT(*) AS `users.agg`,
          COUNT(*) AS `users.count`
      FROM demo_db.users  AS users
      GROUP BY
          1
      ORDER BY
          AVG(users.age ) / COUNT(*) DESC
      LIMIT 500
       ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: users_state {
    type: string
    primary_key: yes
    sql: ${TABLE}.`users.state` ;;
  }

  dimension: users_agg {
    type: number
    sql: ${TABLE}.`users.agg` ;;
  }

  dimension: users_count {
    type: number
    sql: ${TABLE}.`users.count` ;;
  }

  set: detail {
    fields: [users_state, users_agg, users_count]
  }
}
