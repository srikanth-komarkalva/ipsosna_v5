view: shopper_events {
  sql_table_name: z_BDG_Test.shopper_events ;;

  dimension: capture_method {
    type: string
    sql: ${TABLE}.CaptureMethod ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: device_key {
    type: number
    sql: ${TABLE}.device_key ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.EventType ;;
  }

  dimension: hashed_search_terms {
    type: string
    sql: ${TABLE}.hashed_search_terms ;;
  }

  dimension: hashsed_order_id {
    type: string
    sql: ${TABLE}.hashsed_order_id ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: panelist_key {
    type: number
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: price {
    hidden: yes
    type: number
    sql: ${TABLE}.Price ;;
  }

  measure: price_sum {
    label: "Price"
    type: number
    sql: sum(${price}) ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.ProductCode ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.ProductName ;;
  }

  dimension: product_url {
    type: string
    sql: ${TABLE}.ProductURl ;;
  }

  dimension: quantity {
    hidden: yes
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  measure: quantity_sum {
    label: "Quantity"
    type: number
    sql: sum(${quantity}) ;;
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}.record_id ;;
  }

  dimension: retailer {
    type: string
    sql: ${TABLE}.Retailer ;;
  }

  dimension: search_referring_flag {
    type: number
    sql: ${TABLE}.SearchReferringFlag ;;
  }

  dimension_group: start_time_local {
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
    sql: CAST(${TABLE}.start_time_local AS TIMESTAMP) ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [product_name, os_name]
  }
}
