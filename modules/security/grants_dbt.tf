resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_dbt_wh_usage_operate" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "OPERATE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouse_names.dbt
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_execute_task_on_account" {
  provider          = snowflake.accountadmin
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["EXECUTE TASK"]
  on_account        = true
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_bronze_usage_create_schema" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE SCHEMA"]

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_names.bronze
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_silver_usage_create_schema" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE SCHEMA"]

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_names.silver
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_golden_usage_create_schema" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE SCHEMA"]

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_names.golden
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_platform_usage" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_names.platform
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_bronze_bronze_schema_usage_create_table" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE TABLE"]

  on_schema {
    schema_name = var.schema_fqns.bronze_bronze
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_bronze_bronze_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = var.schema_fqns.bronze_bronze
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_bronze_bronze_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = var.schema_fqns.bronze_bronze
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_silver_dimensions_schema_privileges" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    schema_name = var.schema_fqns.silver_dimensions
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_silver_facts_schema_privileges" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    schema_name = var.schema_fqns.silver_facts
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_golden_dataset_schema_privileges" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    schema_name = var.schema_fqns.golden_dataset
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_platform_security_usage" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = var.schema_fqns.platform_security
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_platform_integration_usage" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = var.schema_fqns.platform_integration
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_platform_dbt_runtime_schema_privileges" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE VIEW"]

  on_schema {
    schema_name = var.schema_fqns.platform_dbt_runtime
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_platform_dbt_deployment_schema_privileges" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE", "CREATE DBT PROJECT", "CREATE TASK"]

  on_schema {
    schema_name = var.schema_fqns.platform_dbt_deployment
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_github_integration_usage" {
  provider          = snowflake.accountadmin
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "INTEGRATION"
    object_name = var.github_integration_name
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_dbt_tf_github_pat_secret_read_usage" {
  account_role_name = snowflake_account_role.tf_role_dbt.name
  privileges        = ["READ", "USAGE"]

  on_schema_object {
    object_type = "SECRET"
    object_name = var.github_secret_fqn
  }
}
