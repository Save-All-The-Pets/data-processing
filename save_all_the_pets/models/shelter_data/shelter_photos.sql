WITH base AS (
    SELECT
        {{ dbt_utils.surrogate_key(['photo_1']) }} :: VARCHAR(32) AS photo_id,
        species,
        1 AS photo_position,
        photo_1 AS photo_url,
        NULL AS url_type
    FROM
        {{ ref(
            'shelter_data'
        ) }}
    WHERE
        photo_1 notnull
    UNION
    SELECT
        {{ dbt_utils.surrogate_key(['photo_2']) }} :: VARCHAR(32) AS photo_id,
        species,
        2 AS photo_position,
        photo_2 AS photo_url
    FROM
        {{ ref(
            'shelter_data'
        ) }}
    WHERE
        photo_2 notnull
    UNION
    SELECT
        {{ dbt_utils.surrogate_key(['photo_3']) }} :: VARCHAR(32) AS photo_id,
        species,
        3 AS photo_position,
        photo_3 AS photo_url
    FROM
        {{ ref(
            'shelter_data'
        ) }}
    WHERE
        photo_3 notnull
),
breed_inference_rank AS (
    SELECT
        photo_id,
        inference AS breed_inference,
        RANK() over (
            PARTITION BY photo_id
            ORDER BY
                insert_timestamp DESC
        ) AS photo_infer_rank
    FROM
        {{ source(
            'shelter_data',
            'model_inference'
        ) }}
),
breed_inference AS (
    SELECT
        *
    FROM
        breed_inference_rank
    WHERE
        photo_infer_rank = 1
)
SELECT
    base.*,
    bi.breed_inference
FROM
    base
    LEFT JOIN breed_inference bi
    ON base.photo_id = bi.photo_id
