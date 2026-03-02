resource "snowflake_secret_with_basic_authentication" "tf_github_pat_secret" {
  name     = "TF_GITHUB_PAT_SECRET"
  database = snowflake_database.tf_platform.name
  schema   = snowflake_schema.tf_platform_security.name
  username = var.github_username
  password = var.github_token
}

resource "snowflake_execute" "tf_github_int_snowflake_terraform" {
  provider = snowflake.accountadmin
  execute  = <<-SQL
    CREATE OR REPLACE API INTEGRATION TF_GITHUB_INT_SNOWFLAKE_TERRAFORM
      API_PROVIDER = git_https_api
      API_ALLOWED_PREFIXES = ('https://github.com/mareksyldatk/snowflake-terraform')
      ALLOWED_AUTHENTICATION_SECRETS = (${snowflake_database.tf_platform.name}.${snowflake_schema.tf_platform_security.name}.${snowflake_secret_with_basic_authentication.tf_github_pat_secret.name})
      ENABLED = TRUE
  SQL
  revert   = <<-SQL
    DROP API INTEGRATION IF EXISTS TF_GITHUB_INT_SNOWFLAKE_TERRAFORM
  SQL
  query    = <<-SQL
    DESC API INTEGRATION TF_GITHUB_INT_SNOWFLAKE_TERRAFORM
  SQL

  depends_on = [snowflake_grant_account_role.accountadmin_to_service_user]
}
