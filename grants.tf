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
