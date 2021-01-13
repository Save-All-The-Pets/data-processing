#!/bin/bash

# builds docker image
docker build -t mssql_db .

# starts docker container running the background
docker run --name mssql_server -d -p 1433:1433 -e sa_password=Local_password1! -e ACCEPT_EULA=Y mssql_db
