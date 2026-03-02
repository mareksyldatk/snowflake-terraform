resource "snowflake_grant_account_role" "useradmin_to_service_user" {
  provider  = snowflake.useradmin
  role_name = var.useradmin_role
  user_name = var.user
}
