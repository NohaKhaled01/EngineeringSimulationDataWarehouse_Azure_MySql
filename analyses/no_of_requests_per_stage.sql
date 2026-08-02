-- Number of requests per stage
    -- Filter-able using project ID, stage ID, AND/OR stage title
         -- Replace X with ID required. Replace example with required title
         -- [Optional] Replace 'OR' with 'AND' in the where clause where needed
    -- Without the mart: join projects + stages + requests, group using project_id, stage_id, stage_title, count requests IDs


SELECT *
FROM {{ref('aggmart_requests_in_stage')}}
WHERE project_id = 'X' OR stage_id = 'X' OR stage_title LIKE '%example%'
ORDER BY number_of_requests
;
