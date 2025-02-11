# Objective
Simple step by step dbt transformation with duckdb


# Installation Instructions

```
<optional> pip install --upgrade protobuf

pip install --force-reinstall dbt-core dbt-duckdb
pip install duckdb


```

# Setup
```
dbt init dbt_transformations
```

In your profiles.yml (located in ~/.dbt/), configure the DuckDB connection:

```
dbt_transformations:
  target: dev
  outputs:
    dev:
      type: duckdb
      path: ./database.duckdb

```

# Seed tables
(not used)
- Put a .csv file into de seeds folder and run: dbt seed


# Run project
- Gets csv data as an incremental file with unique key treatment and loads into raw table
- Silver table gets deduplicated data from the raw table
- Gold table is an aggregation of the silver