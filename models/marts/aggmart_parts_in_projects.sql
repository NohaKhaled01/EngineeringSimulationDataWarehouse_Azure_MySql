with projects as(
    SELECT *
    FROM {{ref('stg_simmysql__projects')}}
),

parts as (
    SELECT *
    FROM {{ref('stg_simmysql__parts')}}
),

joined as (
    SELECT p.project_id, p.project_title, 
        c.part_id
    FROM projects as p
    LEFT JOIN parts as c
    ON p.project_id = c.project_id
),

final as (
    SELECT project_id, project_title, 
        COUNT(part_id) as no_of_parts
    FROM joined
    GROUP BY project_id, project_title
    ORDER BY project_id
)

SELECT *
FROM final