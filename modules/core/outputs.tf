output "database_names" {
  value = {
    platform = snowflake_database.tf_platform.name
    bronze   = snowflake_database.tf_bronze.name
    silver   = snowflake_database.tf_silver.name
    golden   = snowflake_database.tf_golden.name
  }
}

output "schema_names" {
  value = {
    bronze_bronze           = snowflake_schema.tf_bronze_bronze.name
    silver_dimensions       = snowflake_schema.tf_silver_dimensions.name
    silver_facts            = snowflake_schema.tf_silver_facts.name
    golden_dataset          = snowflake_schema.tf_golden_dataset.name
    platform_security       = snowflake_schema.tf_platform_security.name
    platform_integration    = snowflake_schema.tf_platform_integration.name
    platform_dbt_runtime    = snowflake_schema.tf_platform_dbt_runtime.name
    platform_dbt_deployment = snowflake_schema.tf_platform_dbt_deployment.name
  }
}

output "schema_fqns" {
  value = {
    bronze_bronze           = "${snowflake_database.tf_bronze.name}.${snowflake_schema.tf_bronze_bronze.name}"
    silver_dimensions       = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_dimensions.name}"
    silver_facts            = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_facts.name}"
    golden_dataset          = "${snowflake_database.tf_golden.name}.${snowflake_schema.tf_golden_dataset.name}"
    platform_security       = "${snowflake_database.tf_platform.name}.${snowflake_schema.tf_platform_security.name}"
    platform_integration    = "${snowflake_database.tf_platform.name}.${snowflake_schema.tf_platform_integration.name}"
    platform_dbt_runtime    = "${snowflake_database.tf_platform.name}.${snowflake_schema.tf_platform_dbt_runtime.name}"
    platform_dbt_deployment = "${snowflake_database.tf_platform.name}.${snowflake_schema.tf_platform_dbt_deployment.name}"
  }
}

output "warehouse_names" {
  value = {
    ingest = snowflake_warehouse.tf_ingest.name
    dbt    = snowflake_warehouse.tf_dbt.name
    bi     = snowflake_warehouse.tf_bi.name
  }
}
