connection: "bdg1"

# include all the views
include: "/views/**/*.view"

datagroup: ipsosna_v5_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ipsosna_v5_default_datagroup

explore: shopper_events {
  label: "BDG User Explore"
  view_name: shopper_events
  view_label: "BDG User Explore"

  join: media_events {
    view_label: "BDG User Explore"
    type: inner
    relationship: one_to_one
    sql_on: ${shopper_events.device_key} = ${media_events.device_key};;
  }

  join: app_events {
    view_label: "BDG User Explore"
    type: inner
    relationship: one_to_one
    sql_on: ${shopper_events.device_key} = ${app_events.device_key};;
  }

  join: web_events {
    view_label: "BDG User Explore"
    type: inner
    relationship: one_to_one
    sql_on: ${shopper_events.device_key} = ${web_events.device_key};;
  }
}
