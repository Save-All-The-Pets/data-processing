WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            'shelter_data',
            'shelter_data_export'
        ) }}
),
renamed AS (
    SELECT
        species,
        breed,
        SIZE,
        weight,
        s_n_status,
        birthdate::date as birthdate,
        age_group,
        sex_gender,
        intake_date::date as intake_date,
        intake_type,
        outcome_date::date as outcome_date,
        outcome_type,
        shelter_zipcode,
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
)
SELECT
    *
FROM
    renamed
