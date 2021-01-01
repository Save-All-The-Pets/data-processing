# Notes around MSSQL Backup Processing

1. Download SaveAllThePets.bak from SFTP site to this directory.  The SaveAllThePets.bak file will be copied into the docker container so it can then be loaded onto the server.
2. Run process_mssql_bak.sh script that will do the following:
  1. Build the docker image.
  2. Start the docker container running in the background.
  3. Run a sqlcmd that loads the SaveAllThePets.bak file into the database.
  4. Exports the Photos and DataExport tables as pipe delimited files in the data directory. 