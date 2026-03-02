terraform {
  required_version = ">= 1.3.0"

  required_providers {
    snowflake = {
      source = "snowflakedb/snowflake"
    }
  }
}

provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  role              = var.role
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file(pathexpand(var.private_key_path))
}

resource "snowflake_database" "tf_db" {
  name         = "TF_PLATFORM"
  is_transient = false
}

resource "snowflake_warehouse" "tf_warehouse" {
  name                      = "TF_PLATFORM_WH"
  warehouse_type            = "STANDARD"
  warehouse_size            = "XSMALL"
  max_cluster_count         = 1
  min_cluster_count         = 1
  auto_suspend              = 60
  auto_resume               = true
  enable_query_acceleration = false
  initially_suspended       = true
}
