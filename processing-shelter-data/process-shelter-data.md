# Notes around MSSQL Backup Processing

1. (Skip if you have it) Download SaveAllThePets.bak from the S3 bucket s3://save-all-the-pets/ site to this directory.  The SaveAllThePets.bak file will be copied into the docker container so it can then be loaded onto the server.
2. (Skip if you have docker built and running) Run 1_setup_mssql_docker.sh script that will do the following:
  1. Build the docker image.
  2. Start the docker container running in the background.
3. (Skip if you have already imported the db) Run 2_import_database.sh which is a sqlcmd that loads loads the SaveAllThePets.bak file into the database.
4. Run 3_produce_data_extract.sh which exports the DataExtract table as pipe delimited files in the data directory. It is then transformed into a csv file that is then loaded to s3
5. Run 4_load_into_rds_postgres.sh which loads the file into RDS Postgres.
   1. In order to run this, you will need to have the following exported to your environment
      1. PGPASSWORD
      2. satp_db_admin_host
      3. $satp_db_admin_user
