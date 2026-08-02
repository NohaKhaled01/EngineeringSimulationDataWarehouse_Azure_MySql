with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'flowlines') }}
),
renamed as (
    SELECT 
        flowline_id,
        stage_id,
        project_name,
        specification_1,
        specification_2,
        specification_3,
        specification_4,
        specification_5,
        specification_6,
        specification_7,
        specification_8,
        specification_9,
        specification_10
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed