    with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'flowlines_materials') }}
),
renamed as (
    SELECT 
        material_id,
        flowline_id,
        project_name,
        segment_name,
        segment_region_name,
        segment_region_material 
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed