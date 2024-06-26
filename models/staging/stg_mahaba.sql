with source as (
    select * 
    exclude(_ROW, AVERAGE, HIGHEST, GCA_SCORES_650_, _FIVETRAN_SYNCED)
    from {{ source('gca_trackers', 'mahaba_fellows') }}
) 

select *, 'mahaba' as cohort from source 
