-- Looking for details on the board level [Projects/Stages/Requests]
-- A wide opened table, filter-able on any column in the table based on requirement [please refer to the table for column names]
    -- Below is an example:
        -- Getting all data for all projects with abbreviation 'example' and request state 'On-Hold'
        -- [Optional] Replace 'AND' with 'OR' in the where clause when needed
    -- Without the mart: join projects + stages + requests

SELECT *
FROM {{ref('mart_project_stage_request')}}
WHERE project_abbreviation = 'example' AND state = 'On-Hold'
ORDER BY project_id, stage_id, request_id
;
