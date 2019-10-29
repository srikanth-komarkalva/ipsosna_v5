view: web_events {
  sql_table_name: z_BDG_Test.web_events ;;

  dimension: category {
#     hidden: yes
    type: string
    group_label: "Web Events"
    sql: ${TABLE}.category ;;
  }

  dimension: device_key {
#     hidden: yes
    group_label: "Web Events"
    type: number
    sql: ${TABLE}.device_key ;;
  }

  dimension: domain_name {
    type: string
    group_label: "Web Events"
    sql: ${TABLE}.Domain_Name ;;
  }

  dimension: dur_minutes {
    type: number
    label: "Duration Minutes"
    group_label: "Web Events"
    sql: ${TABLE}.dur_minutes ;;
  }

  dimension: host_name {
    type: string
    group_label: "Web Events"
    sql: ${TABLE}.host_name ;;
  }

  dimension: os_name {
#     hidden: yes
    group_label: "Web Events"
    type: string
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: panelist_key {
#     hidden: yes
    group_label: "Web Events"
    type: number
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: platform {
#     hidden: yes
    group_label: "Web Events"
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: record_id {
    type: number
    group_label: "Web Events"
#     hidden: yes
    sql: ${TABLE}.Record_ID ;;
  }

  dimension: session_id {
#     hidden: yes
    type: number
    group_label: "Web Events"
    sql: ${TABLE}.Session_ID ;;
  }

  dimension_group: start_time_local {
    type: time
    group_label: "Web Events"
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
    group_label: "Web Events"
    sql: ${TABLE}.subcategory ;;
  }

  dimension: tax_id {
    type: number
    group_label: "Web Events"
    sql: ${TABLE}.Tax_ID ;;
  }

  measure: count {
    type: count
#     hidden: yes
    group_label: "Web Events"
    label: "Count of Web Events"
    drill_fields: [os_name, domain_name, host_name]
  }
}
