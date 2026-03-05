terraform {
  required_providers {
    snowflake = {
      source                = "snowflakedb/snowflake"
      version               = "~> 2.0"
      configuration_aliases = [snowflake.accountadmin]
    }
  }
}
