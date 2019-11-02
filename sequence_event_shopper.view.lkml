view: sequence_event_shopper {
  # view_label: "sequence_event_shopper"
  derived_table: {
    sql: (select Record_ID, panelist_key, 100 as digital_type_id, 'app' as digital_type, App_Name as notes, package_name as value, NULL as search_term_key, Platform, Device_key, start_time_local, dur_minutes, Session_ID, Tax_ID from app_events)
      UNION ALL
      (select Record_ID, panelist_key, 235 as digital_type_id, 'web' as digital_type, Domain_Name as notes, host_name as value, NULL as search_term_key, Platform, device_key, start_time_local, dur_minutes, Session_ID, Tax_ID from web_events)
      UNION ALL
      (select RealLifeMediaID as Record_ID, panelist_key, 483 as digital_type_id, 'media' as digital_type, Channel as notes, Title as value, NULL as search_term_key, Platform, device_key, start_time_local, PlayDuration as dur_minutes, RealLifeMediaID as Session_ID, NULL as Tax_ID from media_events)
      UNION ALL
      (select record_id, panelist_key, 269 as digital_type_id, 'shopper' as digital_type, Retailer as notes, ProductURl as value, hashed_search_terms as search_term_key, Platform, device_key, start_time_local, NULL as dur_minutes, record_id as Session_ID, NULL as Tax_ID from shopper_events)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: record_id {
    type: number
    sql: ${TABLE}.Record_ID ;;
  }

  dimension: panelist_key {
    primary_key: yes
    type: number
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: digital_type_id {
    type: number
    sql: ${TABLE}.digital_type_id ;;
  }

  dimension: digital_type {
    type: string
    sql: ${TABLE}.digital_type ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: search_term_key {
    type: string
    sql: ${TABLE}.search_term_key ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.Platform ;;
  }

  dimension: device_key {
    type: number
    sql: ${TABLE}.Device_key ;;
  }

   dimension_group: start_time_local {
    type: time
    label: "Event"
    group_label: "Start Time"
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

  dimension: dur_minutes {
    type: number
    sql: ${TABLE}.dur_minutes ;;
  }

  measure: dur_minutes_ {
    type: sum
    group_label: "Events"
    label: "Duration Minutes"
    value_format_name: decimal_0
    sql: ${dur_minutes} ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.Session_ID ;;
  }

  dimension: tax_id {
    type: number
    sql: ${TABLE}.Tax_ID ;;
  }

  set: detail {
    fields: [
      record_id,
      panelist_key,
      digital_type_id,
      digital_type,
      notes,
      value,
      search_term_key,
      platform,
      device_key,
      start_time_local_time,
      dur_minutes,
      session_id,
      tax_id
    ]
  }
}
