import pandas as pd
import sqlite3

conn = sqlite3.connect('bluestock_mf.db')

# Load cleaned CSVs
files = {
    'fact_nav': 'data/processed/nav_history_clean.csv',
    'fact_transactions': 'data/processed/investor_transactions_clean.csv',
    'fact_performance': 'data/processed/scheme_performance_clean.csv',
}

for table, path in files.items():
    df = pd.read_csv(path)
    df.to_sql(table, conn, if_exists='replace', index=False)
    print(f"✅ Loaded {table}: {len(df)} rows")

conn.close()
print("✅ Database created: bluestock_mf.db")