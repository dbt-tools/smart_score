with class_scores_with_demographics as (
    select * from {{ ref('int_full_class_demographics') }}
)

select * from class_scores_with_demographics