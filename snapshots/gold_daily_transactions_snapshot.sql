{% snapshot gold_daily_transactions_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='transaction_date',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

SELECT
    transaction_date,
    transaction_count,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ ref('gold_daily_transactions') }}

{% endsnapshot %}