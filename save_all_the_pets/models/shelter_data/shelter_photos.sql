{{ config(
    materialized = 'incremental',
    unique_key = 'photo_url'
) }}

WITH base AS (

    SELECT
        photo_1 AS photo_url,
        NULL AS inferred_fur_type,
        NULL AS inferred_color,
        NULL AS inferred_breed
    FROM
        shelter_data_prod.shelter_data sd
    WHERE
        photo_1 notnull
    UNION
    SELECT
        photo_2 AS photo_url,
        NULL AS inferred_fur_type,
        NULL AS inferred_color,
        NULL AS inferred_breed
    FROM
        shelter_data_prod.shelter_data sd
    WHERE
        photo_1 notnull
    UNION
    SELECT
        photo_3 AS photo_url,
        NULL AS inferred_fur_type,
        NULL AS inferred_color,
        NULL AS inferred_breed
    FROM
        shelter_data_prod.shelter_data sd
    WHERE
        photo_1 notnull
)
SELECT
    *
FROM
    base

{% if is_incremental() %}
WHERE
    photo_url NOT IN (
        SELECT
            photo_url
        FROM
            {{ this }}
    )
{% endif %}
