resource "snowflake_grant_privileges_to_account_role" "tf_role_ingest_tf_ingest_wh_usage_operate" {
  account_role_name = snowflake_account_role.tf_role_ingest.name
  privileges        = ["USAGE", "OPERATE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouse_names.ingest
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_ingest_tf_bronze_usage" {
  account_role_name = snowflake_account_role.tf_role_ingest.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_names.bronze
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_ingest_tf_bronze_bronze_schema_privileges" {
  account_role_name = snowflake_account_role.tf_role_ingest.name
  privileges        = ["USAGE", "CREATE TABLE", "CREATE STAGE", "CREATE FILE FORMAT"]

  on_schema {
    schema_name = var.schema_fqns.bronze_bronze
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_ingest_tf_bronze_bronze_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_ingest.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = var.schema_fqns.bronze_bronze
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_ingest_tf_bronze_bronze_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_ingest.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = var.schema_fqns.bronze_bronze
    }
  }
}
