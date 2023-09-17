with class as ( 
    select * from {{ ref('int_entire_class') }}
), 

top_performers as (
    select 
        full_name,
        ROUND(AVG(score)) as average_score, 
        cohort
    from class 
    group by full_name, cohort
    having AVG(score) >= 700
)

select * from top_performers order by average_score desc
