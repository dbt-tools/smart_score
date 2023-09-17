with akoma as (
    select * from {{ ref('int_akoma') }}
), 

mahaba as (
    select * from {{ ref('int_mahaba') }}
),

entire_class as (
    select * from akoma UNION select * from mahaba
),

date_and_score_formatter as (
  select CONCAT(first, ' ', last) as full_name,
    case 
        when LEN(score) = 3 THEN score
        else null
    end as score, 
    CASE
        WHEN LEN(date) = 10 THEN
            CONCAT(
                RIGHT(date, 4),
                '-',
                CASE
                    WHEN SUBSTRING(date, 3, 1) = '_' THEN
                        '0' || SUBSTRING(date, 2, 1)
                    ELSE
                        SUBSTRING(date, 2, 2)
                END,
                '-',
                CASE
                    WHEN SUBSTRING(date, 6, 1) = '_' THEN
                        '0' || SUBSTRING(date, 5, 1)
                    ELSE
                        SUBSTRING(date, 5, 2)
                END
            )
        WHEN LEN(date) = 11 THEN
            CONCAT(
                RIGHT(date, 4),
                '-',
                CASE
                    WHEN SUBSTRING(date, 4, 1) = '_' THEN
                        '0' || SUBSTRING(date, 3, 1)
                    ELSE
                        SUBSTRING(date, 3, 2)
                END,
                '-',
                CASE
                    WHEN SUBSTRING(date, 7, 1) = '_' THEN
                        '0' || SUBSTRING(date, 6, 1)
                    ELSE
                        SUBSTRING(date, 6, 2)
                END
            )
        WHEN LEN(date) = 9 THEN
            CONCAT(
                RIGHT(date, 4),
                '-',
                '0' || SUBSTRING(date, 2, 1),
                '-',
                '0' || SUBSTRING(date, 4, 1)
            )
        ELSE NULL 
    END AS date, cohort 
    from entire_class 
), 

final as (
    select full_name, score, CAST(date as date) as date, cohort from date_and_score_formatter
)

select * from final 
