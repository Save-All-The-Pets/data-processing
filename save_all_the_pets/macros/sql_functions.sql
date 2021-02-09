{% macro get_weight_unit(column_name) %}
    SUBSTRING(
        {{ column_name }}
        FROM
            '[a-zA-Z]+'
    )
{% endmacro %}

{% macro get_weight_value(column_name) %}
    SUBSTRING(
        {{ column_name }},
        1,
        POSITION(
            SUBSTRING(
                {{ column_name }}
                FROM
                    '[a-zA-Z]+'
            ) IN {{ column_name }}
        ) -1
    ) :: DECIMAL(
        18,
        2
    )
{% endmacro %}

{% macro calc_pound(
        weight_value,
        weight_unit
    ) %}
    CASE
        WHEN {{ weight_unit }} LIKE 'pound' THEN {{ weight_value }}
        WHEN {{ weight_unit }} LIKE 'kilogram' THEN {{ weight_value }} / 2.20462
        WHEN {{ weight_unit }} LIKE 'ounce' THEN {{ weight_value }} / 0.06249992566875
        WHEN {{ weight_unit }} LIKE 'ton' THEN NULL
        WHEN {{ weight_unit }} LIKE 'gram' THEN {{ weight_value }} / 0.00220462
        ELSE NULL
    END
{% endmacro %}
