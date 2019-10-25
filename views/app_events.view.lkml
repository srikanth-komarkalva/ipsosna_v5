view: app_events {
  sql_table_name: z_BDG_Test.app_events ;;

  dimension: app_name {
    type: string
    sql: ${TABLE}.App_Name ;;
  }

  dimension: category {
    hidden: yes
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: device_key {
    hidden: yes
    type: number
    sql: ${TABLE}.Device_key ;;
  }

  dimension: dur_minutes {
    hidden: yes
    type: number
    sql: ${TABLE}.dur_minutes ;;
  }

  dimension: os_name {
    hidden: yes
    type: string
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: package_name {
    type: string
    sql: ${TABLE}.package_name ;;
  }

  dimension: panelist_key {
    hidden: yes
    type: number
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: platform {
    hidden: yes
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: record_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Record_ID ;;
  }

  dimension: session_id {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.subcategory ;;
  }

  dimension: tax_id {
    hidden: yes
    type: number
    sql: ${TABLE}.Tax_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [os_name, app_name, package_name]
  }
}
