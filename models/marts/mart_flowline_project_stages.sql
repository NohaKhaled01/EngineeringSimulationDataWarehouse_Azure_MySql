with projects as (
    SELECT *
    FROM {{ref('stg_simmysql__projects')}}
),

stages as (
    SELECT *
    FROM {{ref('stg_simmysql__stages')}}
),

flowlines as (
    SELECT *
    FROM {{ref('stg_simmysql__flowlines')}}
),

final_combined as (
    SELECT p.project_id, p.project_title, p.project_abbreviation, p.engine_type, p.engine_capacity, p.model_year,
        s.stage_id, s.stage_title, s.stage_name, s.stage_additional_name,
        f.flowline_id, f.project_name, f.specification_1, f.specification_2,
        f.specification_3, f.specification_4, f.specification_5, f.specification_6, f.specification_7, f.specification_8,
        f.specification_9, f.specification_10
    FROM projects as p
    JOIN stages as s
    ON p.project_id = s.project_id
    JOIN flowlines as f
    on s.stage_id = f.stage_id
)

SELECT *
FROM final_combined