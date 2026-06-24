CREATE TABLE IF NOT EXISTS dim_fund (
    fund_id INTEGER PRIMARY KEY,
    amfi_code TEXT UNIQUE,
    fund_name TEXT,
    category TEXT,
    sub_category TEXT
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    year INTEGER,
    month INTEGER,
    quarter INTEGER,
    is_weekend BOOLEAN
);

CREATE TABLE IF NOT EXISTS fact_nav (
    id INTEGER PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    date_id INTEGER REFERENCES dim_date(date_id),
    nav REAL
);

CREATE TABLE IF NOT EXISTS fact_transactions (
    id INTEGER PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    date_id INTEGER REFERENCES dim_date(date_id),
    transaction_type TEXT,
    amount_inr REAL,
    investor_id TEXT,
    kyc_status TEXT
);

CREATE TABLE IF NOT EXISTS fact_performance (
    id INTEGER PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    expense_ratio REAL
);

CREATE TABLE IF NOT EXISTS fact_aum (
    id INTEGER PRIMARY KEY,
    fund_id INTEGER REFERENCES dim_fund(fund_id),
    date_id INTEGER REFERENCES dim_date(date_id),
    aum_value REAL
);