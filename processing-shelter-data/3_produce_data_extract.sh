#!/bin/bash

echo "==> Exporting DataExport table from MSSQL..."
sqlcmd -S localhost,1433 -i export_dataexport.sql -d master -U sa -P Local_password1! -o DataExport_tmp.csv -s "|" -W
sed '2d' DataExport_tmp.csv > DataExport.csv
rm DataExport_tmp.csv

source ../venv/bin/activate

echo "==> Run python script to process extract for postgres..."
python fix_export_file.py

aws s3 cp DataExport_for_postgres.csv s3://save-all-the-pets/

