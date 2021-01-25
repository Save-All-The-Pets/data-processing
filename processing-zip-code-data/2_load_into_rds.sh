#!/bin/bash

psql -h $satp_db_admin_host -U $satp_db_admin_user -d save_all_the_pets -f process_zip_code_table.sql