## Test that the project abb is only two characters [could contain digits]:

SELECT project_abbreviation
FROM {{ ref('stg_simmysql__projects') }}
WHERE project_abbreviation not regexp '^[A-Za-z0-9]{2}$'