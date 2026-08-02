    with source as (
    SELECT *
    FROM {{ source('sim_mysql', 'flowlines_meshes') }}
),
renamed as (
    SELECT 
        mesh_id,
        flowline_id,
        project_name,
        segment_name,
        mesh_file_name
       
    FROM source
)
-- Getting the final output:
SELECT *
FROM renamed