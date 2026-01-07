import pandas as pd
import sqlite3

conn = sqlite3.connect('data/sales.db')
df = pd.read_csv('data/raw/Walmart.csv', parse_dates=['Date'])
df.to_sql('sales_raw', conn, if_exists='replace', index=False)
conn.close()