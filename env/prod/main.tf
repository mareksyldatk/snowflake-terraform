module "core" {
  source = "../../modules/core"

  providers = {
    snowflake = snowflake
  }
}

# Bootstrap grants for the Terraform service user used by providers.
resource "snowflake_grant_account_role" "useradmin_to_service_user" {
  provider  = snowflake.useradmin
  role_name = "USERADMIN"
  user_name = var.user
}

resource "snowflake_grant_account_role" "accountadmin_to_service_user" {
  provider  = snowflake.useradmin
  role_name = "ACCOUNTADMIN"
  user_name = var.user
}

module "integrations" {
  source = "../../modules/integrations"

  providers = {
    snowflake              = snowflake
    snowflake.accountadmin = snowflake.accountadmin
  }

  github_username               = var.github_username
  github_token                  = var.github_token
  github_repo_url               = var.github_repo_url
  github_integration_name       = var.github_integration_name
  platform_database_name        = module.core.database_names.platform
  platform_security_schema_name = module.core.schema_names.platform_security

  depends_on = [
    snowflake_grant_account_role.useradmin_to_service_user,
    snowflake_grant_account_role.accountadmin_to_service_user,
  ]
}

module "security" {
  source = "../../modules/security"

  providers = {
    snowflake              = snowflake
    snowflake.useradmin    = snowflake.useradmin
    snowflake.accountadmin = snowflake.accountadmin
    tls                    = tls
  }

  database_names          = module.core.database_names
  schema_names            = module.core.schema_names
  warehouse_names         = module.core.warehouse_names
  github_integration_name = module.integrations.integration_name
  github_secret_fqn       = module.integrations.secret_fully_qualified_name

  depends_on = [module.integrations]
}
