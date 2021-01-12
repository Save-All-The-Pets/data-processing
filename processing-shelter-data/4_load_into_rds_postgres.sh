#!/bin/bash

psql -h $satp_db_admin_host -U $satp_db_admin_user -d save_all_the_pets -f load_shelter_data_export.sql