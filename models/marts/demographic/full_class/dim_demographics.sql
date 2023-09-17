with formatted_demographics as (
    select * from {{ ref('stg_demographics') }}
)

select * from formatted_demographics
