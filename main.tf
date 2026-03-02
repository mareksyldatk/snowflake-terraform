terraform {
  required_version = ">= 1.3.0"

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.0"
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

provider "snowflake" {
  alias             = "useradmin"
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  role              = var.useradmin_role
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file(pathexpand(var.private_key_path))
}
