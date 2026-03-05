resource "snowflake_schema" "tf_bronze_bronze" {
  database = snowflake_database.tf_bronze.name
  name     = "BRONZE"
}

resource "snowflake_schema" "tf_silver_dimensions" {
  database = snowflake_database.tf_silver.name
  name     = "DIMENSIONS"
}

resource "snowflake_schema" "tf_silver_facts" {
  database = snowflake_database.tf_silver.name
  name     = "FACTS"
}

resource "snowflake_schema" "tf_golden_dataset" {
  database = snowflake_database.tf_golden.name
  name     = "DATASET"
}

resource "snowflake_schema" "tf_platform_security" {
  database = snowflake_database.tf_platform.name
  name     = "SECURITY"
}

resource "snowflake_schema" "tf_platform_integration" {
  database = snowflake_database.tf_platform.name
  name     = "INTEGRATION"
}

resource "snowflake_schema" "tf_platform_dbt_runtime" {
  database = snowflake_database.tf_platform.name
  name     = "DBT_RUNTIME"
}

resource "snowflake_schema" "tf_platform_dbt_deployment" {
  database = snowflake_database.tf_platform.name
  name     = "DBT_DEPLOYMENT"
}
