with source as (
    select * 
    exclude(_ROW, AVERAGE, HIGHEST, GCA_SCORES_650_, _FIVETRAN_SYNCED)
    from {{ source('gca_trackers', 'akoma_fellows') }}
) 

select *, 'akoma' as cohort from source 
