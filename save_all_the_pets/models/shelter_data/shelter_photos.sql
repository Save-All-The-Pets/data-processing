{{ config(
    materialized = 'incremental',
    unique_key = 'photo_id'
) }}

WITH base AS (

    SELECT
        {{ dbt_utils.surrogate_key(['photo_1']) }} :: VARCHAR(32) AS photo_id,
        photo_1 AS photo_url,
        NULL AS url_type,
        '{}' :: jsonb AS inferred_fur_type,
        '{}' :: jsonb AS inferred_color,
        '{}' :: jsonb AS inferred_breed
    FROM
        {{ ref(
            'shelter_data'
        ) }}
    WHERE
        photo_1 notnull
    UNION
    SELECT
        {{ dbt_utils.surrogate_key(['photo_2']) }} :: VARCHAR(32) AS photo_id,
        photo_2 AS photo_url,
        NULL AS url_type,
        '{}' :: jsonb AS inferred_fur_type,
        '{}' :: jsonb AS inferred_color,
        '{}' :: jsonb AS inferred_breed
    FROM
        {{ ref(
            'shelter_data'
        ) }}
    WHERE
        photo_2 notnull
    UNION
    SELECT
        {{ dbt_utils.surrogate_key(['photo_3']) }} :: VARCHAR(32) AS photo_id,
        photo_3 AS photo_url,
        NULL AS url_type,
        '{}' :: jsonb AS inferred_fur_type,
        '{}' :: jsonb AS inferred_color,
        '{}' :: jsonb AS inferred_breed
    FROM
        {{ ref(
            'shelter_data'
        ) }}
    WHERE
        photo_3 notnull
)
SELECT
    base.*
FROM
    base

{% if is_incremental() %}
LEFT JOIN {{ this }} AS th
ON base.photo_id = th.photo_id
WHERE
    th.photo_id IS NULL
{% endif %}
