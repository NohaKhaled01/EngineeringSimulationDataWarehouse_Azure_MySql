{% test date_order(model, column_name, earlier_column) %}
SELECT *
FROM {{ model }}
WHERE {{ column_name }} < {{ earlier_column }}
{% endtest %}