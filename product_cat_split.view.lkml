view: product_cat_split {
  derived_table: {
    sql: SELECT
        ProductCode,
        ProductName,
        Category,
        max(case when product_tag_id = 1 then tag else NULL end) cat1,
        max(case when product_tag_id = 2 then tag else NULL end) cat2,
        max(case when product_tag_id = 3 then tag else NULL end) cat3,
        max(case when product_tag_id = 4 then tag else NULL end) cat4,
        max(case when product_tag_id = 5 then tag else NULL end) cat5,
        max(case when product_tag_id = 6 then tag else NULL end) cat6
        FROM(
        SELECT
        global_id,
        ProductCode,
        ProductName,
        Category,
        tag,
        row_number() over(partition by ProductCode order by global_id) AS product_tag_id
        FROM(
        (SELECT
              row_number() OVER(order by 1) AS global_id,
              ProductCode,
              ProductName,
              Category,
              tag
         FROM
              (SELECT
              ProductCode,
              ProductName,
              Category,
              tag1
              FROM shopper_events
              LEFT JOIN UNNEST(split(shopper_events.category, ' › ')) as tag1
              )
          LEFT JOIN UNNEST(split(tag1, '/')) as tag
        ))
        )
        group by 1,2,3
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

  dimension: cat1 {
    type: string
    sql: ${TABLE}.cat1 ;;
  }

  dimension: cat2 {
    type: string
    sql: ${TABLE}.cat2 ;;
  }

  dimension: cat3 {
    type: string
    sql: ${TABLE}.cat3 ;;
  }

  dimension: cat4 {
    type: string
    sql: ${TABLE}.cat4 ;;
  }

  dimension: cat5 {
    type: string
    sql: ${TABLE}.cat5 ;;
  }

  dimension: cat6 {
    type: string
    sql: ${TABLE}.cat6 ;;
  }

  set: detail {
    fields: [
      product_code,
      product_name,
      category,
      cat1,
      cat2,
      cat3,
      cat4,
      cat5,
      cat6
    ]
  }
}
