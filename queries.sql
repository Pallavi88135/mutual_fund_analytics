-- 1. Top 5 funds by AUM
SELECT amfi_code, MAX(aum_crore) as total_aum
FROM fact_performance
ORDER BY total_aum DESC LIMIT 5;

-- 2. Average NAV per month
SELECT strftime('%Y-%m', date) as month, 
ROUND(AVG(nav), 2) as avg_nav
FROM fact_nav
GROUP BY month ORDER BY month;

-- 3. SIP YoY growth
SELECT strftime('%Y', transaction_date) as year, 
SUM(amount_inr) as sip_total
FROM fact_transactions
WHERE transaction_type = 'SIP'
GROUP BY year ORDER BY year;

-- 4. Transactions by state
SELECT state, COUNT(*) as total_transactions
FROM fact_transactions
GROUP BY state ORDER BY total_transactions DESC;

-- 5. Funds with expense_ratio < 1%
SELECT scheme_name, expense_ratio_pct
FROM fact_performance
WHERE expense_ratio_pct < 1.0;

-- 6. Top 5 funds by 5yr return
SELECT scheme_name, return_5yr_pct
FROM fact_performance
ORDER BY return_5yr_pct DESC LIMIT 5;

-- 7. SIP vs Lumpsum comparison
SELECT transaction_type, 
COUNT(*) as count,
SUM(amount_inr) as total_amount
FROM fact_transactions
GROUP BY transaction_type;

-- 8. Highest NAV ever recorded
SELECT amfi_code, MAX(nav) as highest_nav
FROM fact_nav
GROUP BY amfi_code
ORDER BY highest_nav DESC LIMIT 5;

-- 9. Redemption count per fund
SELECT amfi_code, COUNT(*) as redemptions
FROM fact_transactions
WHERE transaction_type = 'Redemption'
GROUP BY amfi_code
ORDER BY redemptions DESC;

-- 10. KYC Pending investors
SELECT kyc_status, COUNT(*) as count,
SUM(amount_inr) as total_invested
FROM fact_transactions
GROUP BY kyc_status;