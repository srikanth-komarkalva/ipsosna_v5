view: shopper_events {
#   view_label: "Shopper Events"
  sql_table_name: z_BDG_Test.shopper_events ;;

  dimension: capture_method {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.CaptureMethod ;;
  }

  dimension: category {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.Category ;;
  }

  dimension: device_key {
    type: number
    group_label: "Shopper Events"
    sql: ${TABLE}.device_key ;;
  }

  dimension: event_type {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.EventType ;;
  }

  dimension: hashed_search_terms {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.hashed_search_terms ;;
  }

  dimension: hashsed_order_id {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.hashsed_order_id ;;
  }

  dimension: os_name {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: panelist_key {
    type: number
    primary_key: yes
    group_label: "Shopper Events"
    label: "Panelist Key(Shopper)"
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: platform {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.Platform ;;
  }

  dimension: price {
    hidden: yes
    group_label: "Shopper Events"
    type: number
    sql: ${TABLE}.Price ;;
  }

  measure: price_sum {
    value_format_name: decimal_2
    label: "Price"
    type: number
    group_label: "Shopper Events"
    sql: sum(${price}) ;;
  }

  dimension: product_code {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.ProductCode ;;
  }

  dimension: product_name {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.ProductName ;;
  }

  dimension: product_url {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.ProductURl ;;
  }

  dimension: quantity {
    hidden: yes
    group_label: "Shopper Events"
    type: number
    sql: ${TABLE}.Quantity ;;
  }

  measure: quantity_sum {
    label: "Quantity"
    group_label: "Shopper Events"
    value_format_name: decimal_0
    type: number
    sql: sum(${quantity}) ;;
  }

  dimension: record_id {
    type: number
    group_label: "Shopper Events"
    sql: ${TABLE}.record_id ;;
  }

  dimension: retailer {
    type: string
    group_label: "Shopper Events"
    sql: ${TABLE}.Retailer ;;
  }

  dimension: search_referring_flag {
    type: number
    group_label: "Shopper Events"
    sql: ${TABLE}.SearchReferringFlag ;;
  }

  dimension_group: start_time_local {
    type: time
    label: "Purchase Time"
    group_label: "Shopper Events"
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

#   dimension: time_from_purchase {
#     type: number
#     sql: DATETIME_DIFF("${start_time_local_time}","CAST(media_events.start_time_local AS TIMESTAMP)",HOUR);;
# # AND
# #             DATETIME_DIFF(${start_time_local_time},media_events.start_time_local_time,HOUR) <=5,
# #             "YES","FALSE"
# #             end);;
#   }

    dimension_group: since_purchase {
      type: duration
      group_label: "Developer Custom Dimensions"
      intervals: [hour]
      sql_start: CAST(shopper_events.start_time_local AS TIMESTAMP) ;;
      sql_end: CAST(media_events.start_time_local AS TIMESTAMP) ;;
    }

  measure: count {
    type: count
    group_label: "Shopper Events"
    label: "Count of Shopper Events"
    drill_fields: [product_name, os_name]
  }

  measure: Panelist_count {
    type: count_distinct
    group_label: "Shopper Events"
    label: "Count of Panelists"
    sql: ${panelist_key} ;;

  }
}
