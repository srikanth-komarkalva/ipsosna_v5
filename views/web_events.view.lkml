view: web_events {
  sql_table_name: z_BDG_Test.web_events ;;

  dimension: category {
#     hidden: yes
    type: string
    group_label: "Web Events"
    sql: ${TABLE}.category ;;
    drill_fields: [subcategory]
  }

  dimension: device_key {
#     hidden: yes
    group_label: "Web Events"
#     primary_key: yes
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
    hidden: yes
    label: "Duration Minutes"
    group_label: "Web Events"
    sql: ${TABLE}.dur_minutes ;;
  }

  measure: dur_minutes_ {
    type: sum
    group_label: "Web Events"
    label: "Duration Minutes"
    value_format_name: decimal_0
    sql: ${dur_minutes} ;;
  }

  dimension: host_name {
    type: string
    group_label: "Web Events"
    sql: ${TABLE}.host_name ;;
    drill_fields: [domain_name]
  }

  dimension: os_name {
#     hidden: yes
    group_label: "Web Events"
    type: string
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: panelist_key {
#     hidden: yes
    primary_key: yes
    group_label: "Web Events"
    type: number
    label: "Panelist Key(Web)"
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
    label: "Web Time"
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
    drill_fields: [host_name]
  }

  dimension: tax_id {
    type: number
    group_label: "Web Events"
    sql: ${TABLE}.Tax_ID ;;
  }

  measure: count {
    type: count
    group_label: "Web Events"
    label: "Count of Web Events"
    drill_fields: [os_name, domain_name, host_name]
  }
  measure: count_distinct_panelists {
    type: count_distinct
    sql: ${TABLE}.panelist_key ;;
  }

  measure: count_distinct_domains {
    type: count_distinct
    sql: ${TABLE}.Domain_Name ;;
  }
}
