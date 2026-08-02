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

combined_final as (
    SELECT 
        p.project_id, s.stage_id, r.request_id,
        p.project_title, s.stage_title, r.request_name, r.state,
        p.project_abbreviation, p.engine_type, p.engine_capacity, 
        p.model_year, p.model_id_1, p.model_id_2, 
        s.stage_name, s.stage_additional_name, s.stage_description,
        r.type_1_run, r.type_2_run, r.type_3_run, r.type_4_run, r.mixed_type_run, r.request_description,
        p.start_date as project_start, p.close_date as project_ending,
        s.start_date as stage_start, s.close_date as stage_ending,
        r.start_date as request_start, r.close_date as request_ending
    FROM projects as p
    JOIN stages as s
    ON p.project_id = s.project_id
    JOIN requests as r
    ON s.stage_id = r.stage_id
)

SELECT *
FROM combined_final