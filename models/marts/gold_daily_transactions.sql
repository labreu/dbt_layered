{{ config(materialized='table') }}

SELECT
    transaction_date,
    COUNT(*) AS transaction_count,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ ref('silver_transactions') }}
GROUP BY transaction_date
ORDER BY transaction_date