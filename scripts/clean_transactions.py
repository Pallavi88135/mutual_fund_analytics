import pandas as pd

df = pd.read_csv('data/raw/08_investor_transactions.csv')

# Standardise transaction types
valid_types = ['SIP', 'Lumpsum', 'Redemption']
df['transaction_type'] = df['transaction_type'].str.strip().str.title()
df = df[df['transaction_type'].isin(valid_types)]

# Validate amount_inr > 0
df = df[df['amount_inr'] > 0]

# Fix date format
df['transaction_date'] = pd.to_datetime(df['transaction_date'])

# Check KYC status
valid_kyc = ['Verified', 'Pending', 'Rejected']
df = df[df['kyc_status'].isin(valid_kyc)]

df.to_csv('data/processed/investor_transactions_clean.csv', index=False)
print("✅ Transactions cleaned:", len(df), "rows")