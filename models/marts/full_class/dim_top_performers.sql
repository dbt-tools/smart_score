with class as ( 
    select * from {{ ref('int_entire_class') }}
), 

top_performers as (
    select 
        full_name,
        ROUND(AVG(score)) as average_score
    from class 
    group by full_name
    having AVG(score) >= 700
    order by average_score desc 
)

select * from top_performers