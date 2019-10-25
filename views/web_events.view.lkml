view: web_events {
  sql_table_name: z_BDG_Test.web_events ;;

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: device_key {
    type: number
    sql: ${TABLE}.device_key ;;
  }

  dimension: domain_name {
    type: string
    sql: ${TABLE}.Domain_Name ;;
  }

  dimension: dur_minutes {
    type: number
    sql: ${TABLE}.dur_minutes ;;
  }

  dimension: host_name {
    type: string
    sql: ${TABLE}.host_name ;;
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
    drill_fields: [os_name, domain_name, host_name]
  }
}
