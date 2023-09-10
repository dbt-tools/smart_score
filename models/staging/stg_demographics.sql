with demographics as (
    select * from {{ source('gca_trackers', 'fellow_demographic_info') }}
),

formatted_demographics as (
    select full_name, race, gender_identity, ethnicity_encoded_, 
        HIGHEST_LEVEL_OF_EDUCATION_ATTAINED, HIGH_SCHOOL, HIGH_SCHOOL_GRADUATION_YEAR, 
        college_major_or_field_of_study, college, CAST(date_of_birth as date) as date_of_birth 
    from demographics
)


select * from formatted_demographics