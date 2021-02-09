WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'shelter_data',
            'shelter_data_export'
        ) }}
),
zipcode_data AS (
    SELECT
        *
    FROM
        {{ source(
            'shelter_data',
            'zipcode_data'
        ) }}
),
renamed AS (
    SELECT
        species,
        breed,
        SIZE,
        weight,
        -- {{ get_weight_value('weight') }} AS weight_value,
        -- {{ get_weight_unit('weight') }} AS weight_unit,
        s_n_status,
        birthdate :: DATE AS birthdate,
        age_group,
        sex_gender,
        intake_date :: DATE AS intake_date,
        intake_type,
        outcome_date :: DATE AS outcome_date,
        outcome_type,
        shelter_zipcode,
        zipcode_data.type AS shelter_zipcode_type,
        zipcode_data.primary_city AS shelter_city,
        zipcode_data.state AS shelter_state,
        zipcode_data.county AS shelter_county,
        zipcode_data.country AS shelter_country,
        zipcode_data.latitude AS shelter_zip_latitude,
        zipcode_data.longitude AS shelter_zip_longitude,
        zipcode_location_of_where_the_animal_came_from,
        zipcode_location_of_finder,
        photo_1,
        photo_2,
        photo_3,
        video_link,
        bite_status,
        asilomar_status,
        primary_color,
        secondary_color
    FROM
        source
        LEFT JOIN zipcode_data
        ON source.shelter_zipcode = zipcode_data.zip
)
SELECT
    *--,
    -- {{ calc_pound('weight_value', 'weight_unit') }} as weight_in_pounds
FROM
    renamed
