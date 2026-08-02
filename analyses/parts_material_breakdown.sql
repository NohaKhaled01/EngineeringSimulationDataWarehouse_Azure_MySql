-- Looking up parts using part name, or, project name, or, material used
    -- Filter-able using project name AND/OR part name/material
         -- Replace X with ID required. Replace example with required title
         -- [Optional] Replace 'OR' with 'AND' in the where clause where needed
    -- Without the mart: join parts + parts materials

SELECT *
FROM {{ref('mart_parts_materials')}}
WHERE source_project_name LIKE '%example%' OR part_name LIKE '%example%' OR solid_material LIKE '%example%'
ORDER BY source_project_name, part_id
;
