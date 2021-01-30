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
        s_n_status,
        birthdate :: DATE AS birthdate,
        age_group,
        sex_gender,
        intake_date :: DATE AS intake_date,
        intake_type,
        outcome_date :: DATE AS outcome_date,
        outcome_type,
        shelter_zipcode,
        zipcode_data.type as shelter_zipcode_type,
        zipcode_data.primary_city as shelter_city,
        zipcode_data.state as shelter_state,
        zipcode_data.county as shelter_county,
        zipcode_data.country as shelter_country,
        zipcode_data.latitude as shelter_zip_latitude,
        zipcode_data.longitude as shelter_zip_longitude,
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
        left join zipcode_data 
        on source.shelter_zipcode = zipcode_data.zip
)
SELECT
    *
FROM
    renamed
