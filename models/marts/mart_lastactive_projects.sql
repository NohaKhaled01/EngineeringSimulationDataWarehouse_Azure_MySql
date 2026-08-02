with flat_mart as (
    SELECT *
    FROM {{ref('mart_project_stage_request')}}
),

final as (
    SELECT project_id, project_title, 
        stage_title, 
        request_start, request_ending
    FROM (
        SELECT project_id, project_title, stage_title, request_start, request_ending,
            ROW_NUMBER() over (partition by project_id order by request_ending DESC) as row_num
        FROM flat_mart
    ) as sub_table
    WHERE row_num = 1
)

SELECT *
FROM final