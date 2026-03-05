resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_bi_wh_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = var.warehouse_names.bi
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_names.silver
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = var.database_names.golden
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = local.silver_dimensions_schema_fqn
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = local.silver_dimensions_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = local.silver_dimensions_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_all_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = local.silver_dimensions_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_future_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = local.silver_dimensions_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = local.silver_facts_schema_fqn
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = local.silver_facts_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = local.silver_facts_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_all_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = local.silver_facts_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_future_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = local.silver_facts_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = local.golden_dataset_schema_fqn
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = local.golden_dataset_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = local.golden_dataset_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_all_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = local.golden_dataset_schema_fqn
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_future_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = local.golden_dataset_schema_fqn
    }
  }
}
