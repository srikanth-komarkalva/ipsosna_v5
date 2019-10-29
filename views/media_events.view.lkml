view: media_events {
#   view_label: "Media Events"
  sql_table_name: z_BDG_Test.media_events ;;

  dimension: advert {
    type: string
    group_label: "Media Events"
    sql: ${TABLE}.Advert ;;
  }

  dimension: category {
#     hidden: yes
    group_label: "Media Events"
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: channel {
    group_label: "Media Events"
    type: string
    sql: ${TABLE}.Channel ;;
  }

  dimension: description {
    group_label: "Media Events"
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: device_key {
#     hidden: yes
    type: number
#     primary_key: yes
    group_label: "Media Events"
    sql: ${TABLE}.device_key ;;
  }

  dimension: event {
    type: string
    group_label: "Media Events"
    sql: ${TABLE}.Event ;;
  }

  dimension: media_duration {
    type: number
    hidden: yes
    label: "Media Duration"
    group_label: "Media Events"
    sql: ${TABLE}.MediaDuration ;;
  }

  measure: media_duration_ {
    label: "Media Duration"
    type: sum
    group_label: "Media Events"
    value_format_name: decimal_2
    sql: ${media_duration} ;;
  }

  dimension: media_id {
    type: string
    group_label: "Media Events"
    sql: ${TABLE}.MediaId ;;
  }

  dimension: os_name {
#     hidden: yes
    group_label: "Media Events"
    type: string
    sql: ${TABLE}.OS_Name ;;
  }

  dimension: panelist_key {
#     hidden: yes
    type: number
    primary_key: yes
    group_label: "Media Events"
    sql: ${TABLE}.panelist_key ;;
  }

  dimension: platform {
#     hidden: yes
    type: string
    group_label: "Media Events"
    sql: ${TABLE}.Platform ;;
  }

  dimension: play_duration {
    type: number
    hidden: yes
    label: "Play Duration"
    group_label: "Media Events"
    sql: ${TABLE}.PlayDuration ;;
  }

  measure: play_duration_ {
    label: "Play Duration"
    type: sum
    group_label: "Media Events"
    value_format_name: decimal_2
    sql: ${play_duration} ;;
  }

  dimension: real_life_media_id {
    type: number
    group_label: "Media Events"
    sql: ${TABLE}.RealLifeMediaID ;;
  }

  dimension_group: start_time_local {
    type: time
    group_label: "Media Events"
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

  dimension: str_start_time_local {
    type: string
    group_label: "Media Events"
    sql: ${TABLE}.str_start_time_local ;;
  }

  dimension: title {
    type: string
    group_label: "Media Events"
    sql: ${TABLE}.Title ;;
  }

  measure: count {
#     hidden: yes
    group_label: "Media Events"
    label: "Count of Media Events"
    type: count
    drill_fields: [os_name]
  }
}
