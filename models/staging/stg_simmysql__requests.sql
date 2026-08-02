with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'requests') }}
),
renamed as (
    SELECT 
        request_id,
        stage_id,
        Azure_Story_ID as azure_request_id,
        Azure_Feature_Parent as azure_stage_id,
        Request_Name as request_name,
        State as state,
        cast(start_date as date) as start_date,
        cast(close_date as date) as close_date,
        type_1_run,
        type_2_run,
        type_3_run,
        type_4_run,
        mixed_type_run,
        request_description
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed