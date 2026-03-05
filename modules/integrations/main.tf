resource "snowflake_secret_with_basic_authentication" "tf_github_pat_secret" {
  name     = "TF_GITHUB_PAT_SECRET"
  database = var.platform_database_name
  schema   = var.platform_security_schema_name
  username = var.github_username
  password = var.github_token
}

resource "snowflake_execute" "tf_github_int_snowflake_terraform" {
  provider = snowflake.accountadmin
  execute  = <<-SQL
    CREATE OR REPLACE API INTEGRATION ${var.github_integration_name}
      API_PROVIDER = git_https_api
      API_ALLOWED_PREFIXES = ('${var.github_repo_url}')
      ALLOWED_AUTHENTICATION_SECRETS = (${var.platform_database_name}.${var.platform_security_schema_name}.${snowflake_secret_with_basic_authentication.tf_github_pat_secret.name})
      ENABLED = TRUE
  SQL
  revert   = <<-SQL
    DROP API INTEGRATION IF EXISTS ${var.github_integration_name}
  SQL
  query    = <<-SQL
    DESC API INTEGRATION ${var.github_integration_name}
  SQL
}
