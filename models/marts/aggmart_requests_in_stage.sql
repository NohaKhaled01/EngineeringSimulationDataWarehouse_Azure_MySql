with projects as (
    SELECT *
    FROM {{ref('stg_simmysql__projects')}}
),

stages as (
    SELECT *
    FROM {{ref('stg_simmysql__stages')}}
),

requests as (
    SELECT *
    FROM {{ref('stg_simmysql__requests')}}
),

joined as (
    SELECT p.project_id,
        s.stage_id, s.stage_title,
        r.request_id
    FROM projects as p
    JOIN stages as s
    ON p.project_id = s.project_id
    JOIN requests as r
    on s.stage_id = r.stage_id
),

final as (
    SELECT project_id, 
        stage_id, stage_title, 
        COUNT(request_id) as number_of_requests
    FROM joined
    GROUP BY project_id, stage_id, stage_title
    ORDER BY project_id, stage_id, stage_title
)

SELECT *
FROM final