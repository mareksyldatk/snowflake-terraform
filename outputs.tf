# Mock outputs for quick verification and future module wiring.
output "database_names_mock" {
  description = "Database names created by this stack"
  value = {
    platform = snowflake_database.tf_platform.name
    bronze   = snowflake_database.tf_bronze.name
    silver   = snowflake_database.tf_silver.name
    golden   = snowflake_database.tf_golden.name
  }
}

output "warehouse_name_mock" {
  description = "Warehouse name created by this stack"
  value       = snowflake_warehouse.tf_platform.name
}
