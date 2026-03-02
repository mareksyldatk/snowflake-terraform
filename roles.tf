resource "snowflake_account_role" "tf_role_ingest" {
  name = "TF_ROLE_INGEST"
}

resource "snowflake_account_role" "tf_role_dbt" {
  name = "TF_ROLE_DBT"
}

resource "snowflake_account_role" "tf_role_bi" {
  name = "TF_ROLE_BI"
}
