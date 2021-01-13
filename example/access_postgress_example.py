
from psycopg2 import connect
import pandas as pd
import os

# This pulls the save_all_the_pets_db
# from your environment. You will more than likely
# restart whatever application you are using
# to ensure it picks up the change in your environment.
dsn = os.environ["save_all_the_pets_db"]

sql = """
select *
from shelter_data.shelter_data_export
limit 10
"""

conn = connect(dsn)

# always recommended to do database connections
# in a try-catch to ensure that when you
# are done, you are closing the database connection
# since leaving database connections open
# can be resource intensive on the server
try:
    df = pd.read_sql(sql, conn)
finally:
    conn.close()
