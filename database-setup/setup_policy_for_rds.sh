#!/bin/bash

# requires admin rights

aws iam create-policy \
   --policy-name rds-s3-import-policy \
   --policy-document '{
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "s3import",
         "Action": [
           "s3:GetObject",
           "s3:ListBucket"
         ],
         "Effect": "Allow",
         "Resource": [
           "arn:aws:s3:::save-all-the-pets",
           "arn:aws:s3:::save-all-the-pets/*"
         ]
       }
     ]
   }'

aws iam create-role \
   --role-name rds-s3-import-role \
   --assume-role-policy-document '{
     "Version": "2012-10-17",
     "Statement": [
       {
         "Effect": "Allow",
         "Principal": {
            "Service": "rds.amazonaws.com"
          },
         "Action": "sts:AssumeRole"
       }
     ]
   }'

aws iam attach-role-policy \
   --policy-arn  arn:aws:iam::205664189419:policy/rds-s3-import-policy \
   --role-name rds-s3-import-role                    