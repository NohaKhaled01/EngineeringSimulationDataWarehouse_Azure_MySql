-- Number of stages and requests in each project
    -- Filter-able using project ID OR project title
         -- Replace X with ID required. Replace example with required title
    -- Without the mart: join projects + stages + requests, group using project_id, project_title, count distinct stage_id & request_id
        -- OR: using mart_project_stage_request, group using project_id, project_title, count distinct stage_id & request_id

SELECT *
FROM {{ref('aggmart_stages_requests_in_project')}}
WHERE project_id = 'X' OR project_title LIKE '%example%'
ORDER BY number_of_stages, number_of_requests
;
