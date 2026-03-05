locals {
  bronze_bronze_schema_fqn           = "${var.database_names.bronze}.${var.schema_names.bronze_bronze}"
  silver_dimensions_schema_fqn       = "${var.database_names.silver}.${var.schema_names.silver_dimensions}"
  silver_facts_schema_fqn            = "${var.database_names.silver}.${var.schema_names.silver_facts}"
  golden_dataset_schema_fqn          = "${var.database_names.golden}.${var.schema_names.golden_dataset}"
  platform_security_schema_fqn       = "${var.database_names.platform}.${var.schema_names.platform_security}"
  platform_integration_schema_fqn    = "${var.database_names.platform}.${var.schema_names.platform_integration}"
  platform_dbt_runtime_schema_fqn    = "${var.database_names.platform}.${var.schema_names.platform_dbt_runtime}"
  platform_dbt_deployment_schema_fqn = "${var.database_names.platform}.${var.schema_names.platform_dbt_deployment}"
}
