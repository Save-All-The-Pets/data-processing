{{ config(
    materialized = 'incremental',
    unique_key = 'photo_id'
) }}

WITH base AS (

    SELECT
        {{ dbt_utils.surrogate_key(['photo_1']) }} :: VARCHAR(32) AS photo_id,
        photo_1 AS photo_url,
        NULL AS inferred_fur_type,
        NULL AS inferred_color,
        NULL AS inferred_breed
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
        NULL AS inferred_fur_type,
        NULL AS inferred_color,
        NULL AS inferred_breed
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
        NULL AS inferred_fur_type,
        NULL AS inferred_color,
        NULL AS inferred_breed
    FROM
        {{ ref(
            'shelter_data'
        ) }}
    WHERE
        photo_3 notnull
)
SELECT
    *
FROM
    base

{% if is_incremental() %}
WHERE
    photo_id NOT IN (
        SELECT
            photo_id
        FROM
            {{ this }}
    )
{% endif %}

{{
config({
    "post-hook": [
      "{{ postgres_utils.index(this, 'photo_id')}}",
    ],
    })
}}