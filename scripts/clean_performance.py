import pandas as pd

df = pd.read_csv('data/raw/07_scheme_performance.csv')

# Check columns first
print("Columns:", df.columns.tolist())

# Make return values numeric
for col in df.select_dtypes(exclude='number').columns:
    try:
        df[col] = pd.to_numeric(df[col], errors='coerce')
    except:
        pass

# Flag anomalies
df['is_anomaly'] = df.isnull().any(axis=1)

# Validate expense_ratio between 0.1 and 2.5
if 'expense_ratio' in df.columns:
    df = df[(df['expense_ratio'] >= 0.1) & 
            (df['expense_ratio'] <= 2.5)]

df.to_csv('data/processed/scheme_performance_clean.csv', index=False)
print("✅ Performance cleaned:", len(df), "rows")