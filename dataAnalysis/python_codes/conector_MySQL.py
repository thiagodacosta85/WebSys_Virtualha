# imports
import os
from sqlalchemy import create_engine
import pandas as pd

# settings
os.system('cls')
os.system('color 6')


# conector
engine = create_engine(
    "mysql+pymysql://llpdigital:password@192.168.0.163:3306/virtualha")
os.system('cls')

df_localidades = pd.read_sql_query("SELECT * FROM localidades", engine)

print(df_localidades)
