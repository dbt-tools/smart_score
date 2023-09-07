-- {{ dbt_utils.unpivot(ref('stg_akoma'), cast_to='varchar', exclude=['date','status']) }}
-- with akoma as (
--     select * from {{ ref('stg_akoma') }}
-- ),

-- with unpivoted as (
    
-- )
select * from {{ ref('stg_akoma') }}
