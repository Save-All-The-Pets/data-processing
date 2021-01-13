drop table if exists shelter_data_export;

create table shelter_data_export(
species TEXT,
breed TEXT,
size TEXT,
weight TEXT,
s_n_status TEXT,
birthdate TEXT,
age_group TEXT,
sex_gender TEXT,
intake_date TEXT,
intake_type TEXT,
outcome_date TEXT,
outcome_type TEXT,
shelter_zipcode TEXT,
zipcode_location_of_where_the_animal_came_from TEXT,
zipcode_location_of_finder TEXT,
photo_1 TEXT,
photo_2 TEXT,
photo_3 TEXT,
video_link TEXT,
bite_status TEXT,
asilomar_status TEXT,
primary_color TEXT,
secondary_color TEXT);

SELECT aws_s3.table_import_from_s3(
   'shelter_data_export',
   '',
   '(format csv)',
   aws_commons.create_s3_uri(
   'save-all-the-pets',
   'DataExport_for_postgres.csv',
   'us-east-1'
)
);

drop table if exists shelter_data.shelter_data_export;

alter table shelter_data_export set schema shelter_data;