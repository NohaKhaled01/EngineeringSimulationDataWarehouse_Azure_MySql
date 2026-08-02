with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'parts') }}
),
renamed as (
    SELECT 
        part_id,
        project_id,
        source_project_name,
        part_name
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed