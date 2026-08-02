with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'stages') }}
),
renamed as (
    SELECT 
        stage_id,
        project_id,
        Azure_stage_ID as azure_stage_id,
        stage_title,
        Azure_Epic_ID as azure_epic_id,
        stage_name,
        stage_add_name as stage_additional_name,
        text_description as stage_description,
        cast(start_date as date) as start_date,
        cast(close_date as date) as close_date
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed