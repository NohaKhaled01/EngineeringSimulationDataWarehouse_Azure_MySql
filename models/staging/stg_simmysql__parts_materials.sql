with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'parts_materials') }}
),
renamed as (
    SELECT 
        material_id,
        part_id,
        source_project_name,
        part_name,
        solid_name,
        solid_material
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed