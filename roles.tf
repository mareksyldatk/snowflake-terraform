resource "snowflake_account_role" "tf_role_ingest" {
  provider = snowflake.useradmin
  name     = "TF_ROLE_INGEST"
}

resource "snowflake_account_role" "tf_role_dbt" {
  provider = snowflake.useradmin
  name     = "TF_ROLE_DBT"
}

resource "snowflake_account_role" "tf_role_bi" {
  provider = snowflake.useradmin
  name     = "TF_ROLE_BI"
}
