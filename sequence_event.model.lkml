connection: "bdg1"

# include all the views
include: "/**/*.view"

datagroup: ipsosna_v5_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ipsosna_v5_default_datagroup

explore: sequence_event_shopper {
  label: "BDG User Explore_shopper"
  view_name: sequence_event_shopper
  view_label: "BDG User Explore_shopper"

  join: shopper_events {
    view_label: "BDG User Explore_shopper"
    type: inner
    relationship: one_to_one
    sql_on: ${sequence_event_shopper.record_id} = ${shopper_events.record_id} and ${sequence_event_shopper.panelist_key} = ${shopper_events.panelist_key};;
  }

  }
