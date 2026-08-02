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
    SELECT p.project_id, p.project_title, 
        s.stage_id,
        r.request_id
    FROM projects as p
    JOIN stages as s
    ON p.project_id = s.project_id
    JOIN requests as r
    on s.stage_id = r.stage_id
    
),

final as (
    SELECT project_id, project_title, 
        COUNT(DISTINCT stage_id) as number_of_stages, 
        COUNT(request_id) as number_of_requests
    FROM joined
    GROUP BY project_id, project_title
    ORDER BY project_id
)

SELECT *
FROM final