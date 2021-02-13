create database save_all_the_pets;
create schema shelter_data;

create user alex with password '[password]';
create user les with password '[password]';
create user ian with password '[password]';
create user michael with password '[password]';
create user ross with password '[password]';
create user ned with password '[password]';
create user taylor with password '[password]';

create group data_users;
alter group data_users add user alex;
alter group data_users add user les;
alter group data_users add user ian;
alter group data_users add user michael;
alter group data_users add user ross;
alter group data_users add user ned;
alter group data_users add user taylor;

grant usage on schema shelter_data to group data_users;
grant all on all tables in schema shelter_data to group data_users;
grant create on schema shelter_data to group data_users;

grant usage on schema shelter_data_dev to group data_users;
grant all on all tables in schema shelter_data_dev to group data_users;
grant create on schema shelter_data_dev to group data_users;

grant usage on schema shelter_data_prod to group data_users;
grant all on all tables in schema shelter_data_prod to group data_users;
grant create on schema shelter_data_dev to group data_users;

grant create on database save_all_the_pets to group data_users;

CREATE EXTENSION aws_s3 CASCADE;