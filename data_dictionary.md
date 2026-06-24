\# Data Dictionary - Mutual Fund Analytics



\## fact\_nav

| Column | Type | Description |

|--------|------|-------------|

| amfi\_code | TEXT | Unique fund identifier |

| date | DATE | NAV recorded date |

| nav | REAL | Net Asset Value |



\## fact\_transactions

| Column | Type | Description |

|--------|------|-------------|

| investor\_id | TEXT | Unique investor ID |

| transaction\_date | DATE | Date of transaction |

| amfi\_code | TEXT | Fund identifier |

| transaction\_type | TEXT | SIP/Lumpsum/Redemption |

| amount\_inr | REAL | Transaction amount in INR |

| state | TEXT | Investor state |

| kyc\_status | TEXT | Verified/Pending/Rejected |



\## fact\_performance

| Column | Type | Description |

|--------|------|-------------|

| scheme\_name | TEXT | Name of the fund |

| category | TEXT | Fund category |

| expense\_ratio\_pct | REAL | Annual expense ratio % |

| return\_1yr\_pct | REAL | 1 year return % |

| return\_3yr\_pct | REAL | 3 year return % |

| return\_5yr\_pct | REAL | 5 year return % |

| risk\_grade | TEXT | Risk level of fund |

