with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'projects') }}
),
renamed as (
    SELECT 
        project_id,
        Azure_Epic_ID as azure_epic_id,
        Title as project_title,
        project_abbreviation,
        engine_type,
        engine_capacity, 
        model_year,
        model_id_1,
        model_id_2,
        cast(start_date as date) as start_date,
        cast(end_date as date) as close_date
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed