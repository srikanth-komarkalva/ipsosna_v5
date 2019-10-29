view: app_events {
#   view_label: "App Events"
  sql_table_name: z_BDG_Test.app_events ;;

  dimension: app_name {
    type: string
    group_label: "App Events"
    sql: ${TABLE}.App_Name ;;
  }

  dimension: category {
#     hidden: yes
    group_label: "App Events"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: device_key {
#     hidden: yes
    group_label: "App Events"
    primary_key: yes
    type: number
    sql: ${TABLE}.Device_key ;;
  }

  dimension: dur_minutes {
    hidden: yes
    group_label: "App Events"
    type: number
    sql: ${TABLE}.dur_minutes ;;
  }

  measure: dur_minutes_ {
    label: "Duration Minutes"
    type: sum
    group_label: "App Events"
    value_format_name: decimal_2
    sql: ${dur_minutes} ;;
  }

  dimension: os_name {
#     hidden: yes
    group_label: "App Events"
    type: string
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: package_name {
    type: string
    group_label: "App Events"
    sql: ${TABLE}.package_name ;;
  }

  dimension: panelist_key {
#     hidden: yes
    group_label: "App Events"
    type: number
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: platform {
#     hidden: yes
    group_label: "App Events"
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: record_id {
#     hidden: yes
    group_label: "App Events"
    type: number
    sql: ${TABLE}.Record_ID ;;
  }

  dimension: session_id {
#     hidden: yes
    group_label: "App Events"
    type: number
    sql: ${TABLE}.Session_ID ;;
  }

  dimension_group: start_time_local {
    type: time
    group_label: "App Events"
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

  dimension: subcategory {
#     hidden: yes
    group_label: "App Events"
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: tax_id {
#     hidden: yes
    group_label: "App Events"
    type: number
    sql: ${TABLE}.Tax_ID ;;
  }

  measure: count {
    group_label: "App Events"
    label: "Count of App Events"
    type: count
    drill_fields: [os_name, app_name, package_name]
  }
}
