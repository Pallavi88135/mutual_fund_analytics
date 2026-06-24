import pandas as pd

df = pd.read_csv('data/raw/08_investor_transactions.csv')
print("Columns:", df.columns.tolist())
print(df.head(2))