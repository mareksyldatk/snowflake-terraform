terraform {
  required_version = ">= 1.3.0"

  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.0"
    }
  }
}

# Default provider
provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  role              = "SYSADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file(pathexpand(var.private_key_path))
}

provider "snowflake" {
  alias             = "useradmin"
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  role              = "USERADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file(pathexpand(var.private_key_path))
}

provider "snowflake" {
  alias             = "accountadmin"
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  role              = "ACCOUNTADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = file(pathexpand(var.private_key_path))
}
