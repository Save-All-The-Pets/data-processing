DROP TABLE IF EXISTS zipcode_data;

CREATE TABLE zipcode_data (
    zip text,
    type TEXT,
    decommissioned text,
    primary_city text,
    acceptable_cities text,
    unacceptable_cities text,
    state text,
    county text,
    timezone text,
    area_codes text,
    world_region text,
    country text,
    latitude text,
    longitude text,
    irs_estimated_population_2015 text
);

SELECT
    aws_s3.table_import_from_s3 ( --
        'zipcode_data', --
        '', --
        '(format csv)', --
        aws_commons.create_s3_uri ( --
            'save-all-the-pets', --
            'zip_code_database.csv', --
            'us-east-1'));

DROP TABLE IF EXISTS shelter_data.zipcode_data;

ALTER TABLE zipcode_data SET SCHEMA shelter_data;

grant usage on schema shelter_data to group data_users;

grant select on all tables in schema shelter_data to group data_users;
