with fellows as (
    select * from {{ ref('int_entire_class') }}
),

quick_metrics as (
    select 
        full_name,
        ROUND(AVG(score)) as average_score, 
        SUM(CASE WHEN score >= 650 THEN 1 ELSE 0 END) as times_above_650,
        SUM(CASE WHEN score >= 700 THEN 1 ELSE 0 END) as times_above_700,
        MAX(score) as highest_score, 
        SUM(CASE WHEN score is NULL THEN 1 ELSE 0 END) as missing,
        SUM(CASE WHEN score is not NULL THEN 1 ELSE 0 END) as attempts
    from fellows 
    group by full_name
),

final as (
    select * from quick_metrics order by full_name 
)

select * from final 
