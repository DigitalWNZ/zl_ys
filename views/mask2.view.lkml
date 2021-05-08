view: dummy2 {
  derived_table: {
    sql: select 9 as dummy

             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dummy {
    type: number
    sql: ${TABLE}.dummy ;;
  }

  set: detail {
    fields: [dummy]
  }
}
