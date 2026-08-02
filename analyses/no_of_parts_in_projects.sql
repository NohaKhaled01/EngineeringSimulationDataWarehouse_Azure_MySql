-- Number of parts in each project in DB
    -- Filter-able using project ID OR project title
         -- Replace X with ID required. Replace example with required title
    -- Without the mart: join projects + parts, group using project_id, project_title, count part IDs
        -- OR: using mart_parts_project, group using project_id, project_title, count part IDs


SELECT *
FROM {{ref('aggmart_parts_in_projects')}}
WHERE project_id = 'X' OR project_title LIKE '%example%'
ORDER BY number_of_parts
;
