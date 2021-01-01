#!/bin/bash

# builds docker image
docker build -t mssql_db .

# starts docker container running the background
docker run --name mssql_server -d -p 1433:1433 -e sa_password=Local_password1 -e ACCEPT_EULA=Y mssql_db

# loads the SaveAllThePets.bak file
sqlcmd -S localhost,1433 -i import_database_file.sql -d master -U sa -P Local_password1!

sqlcmd -S localhost,1433 -i export_photos.sql -d master -U sa -P Local_password1! -o data/Photos_tmp.csv -s "|" -W
sed '2d' data/Photos_tmp.csv > data/Photos.csv
rm data/Photos_tmp.csv

sqlcmd -S localhost,1433 -i export_dataexport.sql -d master -U sa -P Local_password1! -o data/DataExport_tmp.csv -s "|" -W
sed '2d' data/DataExport_tmp.csv > data/DataExport.csv
rm data/DataExport_tmp.csv
