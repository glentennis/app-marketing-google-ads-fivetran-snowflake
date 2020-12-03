view: geotargeting {
  sql_table_name: BI_DEV.geotargeting ;;

  dimension: canonical_name {
    type: string
    sql: ${TABLE}.Canonical_Name ;;
  }

  dimension: country_code {
    map_layer_name: countries
    type: string
    sql: ${TABLE}.Country_Code ;;
  }

  dimension: criteria_id {
    type: number
    sql: ${TABLE}.Criteria_ID ;;
  }

  dimension: criteria_id_string {
    type: number
    sql: TO_CHAR(${TABLE}.Criteria_ID) ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.Parent_ID ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.Target_Type ;;
  }

  dimension: is_us_state {
    type: yesno
    sql: ${country_code} = 'US' AND ${target_type} = 'State' ;;
  }

  dimension: state {
    map_layer_name: us_states
    type: string
    sql: IFF(${is_us_state}, ${name}, NULL) ;;
  }

  dimension: is_us_postal_code {
    type: yesno
    sql: ${country_code} = 'US' AND ${target_type} = 'Postal Code' ;;
  }

  dimension: postal_code {
    map_layer_name: us_zipcode_tabulation_areas
    type: string
    sql: IFF(${is_us_postal_code}, ${name}, NULL) ;;
  }
}
