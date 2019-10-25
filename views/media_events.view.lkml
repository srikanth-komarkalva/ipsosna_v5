view: media_events {
  sql_table_name: z_BDG_Test.media_events ;;

  dimension: advert {
    type: string
    sql: ${TABLE}.Advert ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.Category ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.Channel ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.Description ;;
  }

  dimension: device_key {
    type: number
    sql: ${TABLE}.device_key ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.Event ;;
  }

  dimension: media_duration {
    type: number
    sql: ${TABLE}.MediaDuration ;;
  }

  dimension: media_id {
    type: string
    sql: ${TABLE}.MediaId ;;
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

  dimension: play_duration {
    type: number
    sql: ${TABLE}.PlayDuration ;;
  }

  dimension: real_life_media_id {
    type: number
    sql: ${TABLE}.RealLifeMediaID ;;
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

  dimension: str_start_time_local {
    type: string
    sql: ${TABLE}.str_start_time_local ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  measure: count {
    type: count
    drill_fields: [os_name]
  }
}
