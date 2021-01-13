import pandas as pd
dataexport_df = pd.read_csv("s3://save-all-the-pets/DataExport_for_postgres.csv")
dataexport_df.head()