select 
    -- CONCAT(first, ' ', last) AS full_name,
    -- _1_23_2023 AS "01/23/2023",
    -- _2_6_2023 AS "02/06/2023",
    -- _3_13_2023 AS "03/13/2023",
    -- _4_5_2023 AS "04/05/2023",
    -- _04_26_2023 AS "04/26/2023",
    -- _05_17_2023 AS "05/17/2023",
    -- _06_14_2023 AS "06/14/2023"
    *
    exclude(_ROW, AVERAGE, HIGHEST, GCA_SCORES_650_, _FIVETRAN_SYNCED)
 from {{ source('gca_trackers', 'akoma_fellows') }}

--  name   date    score 
--  india  01/3/2023 700
--  india 
