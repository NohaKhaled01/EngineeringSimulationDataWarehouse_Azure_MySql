with flowlines as (
    SELECT *
    FROM {{ref('stg_simmysql__flowlines')}}
),

flowlines_materials as (
    SELECT *
    FROM {{ref('stg_simmysql__flowlines_materials')}}
),

final as (
    SELECT f.flowline_id, f.stage_id, f.project_name, 
        em.segment_name, em.segment_region_name, em.segment_region_material, em.material_id
    FROM flowlines as f
    JOIN flowlines_materials as em
    ON f.flowline_id = em.flowline_id
)

SELECT *
FROM final