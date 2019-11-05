view: product_category {
  derived_table: {
    sql: SELECT ProductCode,
        ProductName,
        Category,
        tag
      FROM
      (SELECT ProductCode,
        ProductName,
        Category,
        tag1
      FROM shopper_events
      LEFT JOIN UNNEST(split(shopper_events.category, ' › ')) as tag1)
      LEFT JOIN UNNEST(split(tag1, '/')) as tag
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.ProductCode ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductName ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  set: detail {
    fields: [product_code, product_name, category, tag]
  }
}
