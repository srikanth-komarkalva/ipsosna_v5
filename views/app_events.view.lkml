view: app_events {
  sql_table_name: z_BDG_Test.app_events ;;

  dimension: app_name {
    type: string
    sql: ${TABLE}.App_Name ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: device_key {
    type: number
    sql: ${TABLE}.Device_key ;;
  }

  dimension: dur_minutes {
    type: number
    sql: ${TABLE}.dur_minutes ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.package_name ;;
  }

  dimension: panelist_key {
    type: number
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}.Record_ID ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.Session_ID ;;
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

  dimension: subcategory {
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: tax_id {
    type: number
    sql: ${TABLE}.Tax_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [os_name, app_name, package_name]
  }
}
