with class_scores as (
    select * from {{ ref('dim_snapshot') }}
),

demographics as (
    select * from {{ ref('stg_demographics') }}
),

class_scores_with_demographics as (
    select * from class_scores join demographics using(full_name)
)

select * from class_scores_with_demographics