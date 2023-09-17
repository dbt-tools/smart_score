{{
    config(
        materialized='table'
    )
}}

{{ dbt_utils.unpivot(ref('stg_mahaba'), exclude=['first', 'last', 'cohort'], field_name = "date", value_name="score")}}
