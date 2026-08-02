with parts as (
    SELECT *
    FROM {{ref('stg_simmysql__parts')}}
),

parts_materials as (
    SELECT *
    FROM {{ref('stg_simmysql__parts_materials')}}
),

final as (
    SELECT c.source_project_name, c.part_id, c.part_name,
        cm.solid_name, cm.solid_material, cm.material_id
    FROM parts as c 
    JOIN parts_materials as cm
    ON c.part_id = cm.part_id
)

SELECT *
FROM final
