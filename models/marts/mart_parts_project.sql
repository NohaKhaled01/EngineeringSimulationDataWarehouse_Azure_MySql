with parts as (
    SELECT *
    FROM {{ref('stg_simmysql__parts')}}
),

projects as (
    SELECT *
    FROM {{ref('stg_simmysql__projects')}}
),

final as (
    SELECT p.project_id, p.project_title, p.project_abbreviation, p.engine_type, p.engine_capacity, p.model_year,
        c.part_id, c.source_project_name, c.part_name
    FROM projects as p
    JOIN parts as c
    ON p.project_id = c.project_id
)

SELECT *
FROM final
