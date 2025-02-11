{{ config(materialized='table') }}

SELECT
    transaction_date,
    COUNT(*) AS transaction_count
FROM {{ ref('silver_transactions') }}
GROUP BY transaction_date
ORDER BY transaction_date