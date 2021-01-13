#!/bin/bash

# loads the SaveAllThePets.bak file
sqlcmd -S localhost,1433 -i import_database_file.sql -d master -U sa -P Local_password1!