SELECT *
FROM {{ ref('raw_transactions') }}
WHERE price < 0
