import pandas as pd
df = pd.read_csv("DataExport.csv", sep="|")
df.to_csv("DataExport_for_postgres.csv", header=False, index=False)