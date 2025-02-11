{{ config(materialized='table') }}

WITH deduplicated AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY id_transaction ORDER BY loaded_at DESC) AS rn
    FROM {{ ref('raw_transactions') }}
)
SELECT
    id_transaction,
    transaction_date,
    price,
    loaded_at
FROM deduplicated
WHERE rn = 1

--transaction_date,id_transaction,product_id,price