-- Finding the last time a project was active, on which stage, and date
    -- Filter-able using project id OR project title
        -- Replace 'X' with ID required. Replace example with required title
    -- Without the mart: use row_number window function over project id, ordering request end date descendingly, and include only row numbers = 1

SELECT *
FROM {{ref('mart_lastactive_projects')}}
WHERE project_id = 'X' OR project_title LIKE '%example%'
ORDER BY project_id, project_title
;
