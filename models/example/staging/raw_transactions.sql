{{ config(materialized='incremental') }}

SELECT *, current_localtimestamp() as loaded_at
FROM read_csv_auto('{{ var("raw_data_path") }}')
