SELECT *
FROM {{ ref('gold_daily_transactions_snapshot') }}
WHERE transaction_date < '2023-01-01'