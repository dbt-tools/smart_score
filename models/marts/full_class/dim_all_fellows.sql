with full_class as (
    select * from {{ ref("int_entire_class") }}
), 

full_class_metrics as (
    SELECT
        EXTRACT(YEAR FROM date) AS year,
        EXTRACT(MONTH FROM date) AS month,
        ROUND(AVG(score)) AS average_score,
        MAX(score) AS max_score,
        MIN(CASE WHEN score > 600 THEN score ELSE NULL END) as min_score,
        COUNT(*) AS tests_taken
    FROM full_class
    GROUP BY year, month
    ORDER BY year, month
)

select * from full_class_metrics order by month
