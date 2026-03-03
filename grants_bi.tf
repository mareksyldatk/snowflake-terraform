resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_bi_wh_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "WAREHOUSE"
    object_name = snowflake_warehouse.tf_bi.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_silver.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.tf_golden.name
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_dimensions.name}"
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_dimensions.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_dimensions.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_all_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_dimensions.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_dimensions_select_future_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_dimensions.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_facts.name}"
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_facts.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_facts.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_all_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_facts.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_silver_facts_select_future_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = "${snowflake_database.tf_silver.name}.${snowflake_schema.tf_silver_facts.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_usage" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["USAGE"]

  on_schema {
    schema_name = "${snowflake_database.tf_golden.name}.${snowflake_schema.tf_golden_dataset.name}"
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_all_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = "${snowflake_database.tf_golden.name}.${snowflake_schema.tf_golden_dataset.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_future_tables" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "TABLES"
      in_schema          = "${snowflake_database.tf_golden.name}.${snowflake_schema.tf_golden_dataset.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_all_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    all {
      object_type_plural = "VIEWS"
      in_schema          = "${snowflake_database.tf_golden.name}.${snowflake_schema.tf_golden_dataset.name}"
    }
  }
}

resource "snowflake_grant_privileges_to_account_role" "tf_role_bi_tf_golden_dataset_select_future_views" {
  account_role_name = snowflake_account_role.tf_role_bi.name
  privileges        = ["SELECT"]

  on_schema_object {
    future {
      object_type_plural = "VIEWS"
      in_schema          = "${snowflake_database.tf_golden.name}.${snowflake_schema.tf_golden_dataset.name}"
    }
  }
}
