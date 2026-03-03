resource "tls_private_key" "tf_svc_ingest_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "snowflake_service_user" "tf_svc_ingest" {
  provider          = snowflake.useradmin
  name              = "TF_SVC_INGEST"
  default_role      = snowflake_account_role.tf_role_ingest.name
  default_warehouse = snowflake_warehouse.tf_ingest.name
  default_namespace = "${snowflake_database.tf_bronze.name}.${snowflake_schema.tf_bronze_bronze.name}"
  rsa_public_key = replace(
    tls_private_key.tf_svc_ingest_key.public_key_pem,
    "/-----BEGIN PUBLIC KEY-----|-----END PUBLIC KEY-----|\\s/",
    ""
  )
}

resource "snowflake_grant_account_role" "tf_role_ingest_to_tf_svc_ingest" {
  provider  = snowflake.useradmin
  role_name = snowflake_account_role.tf_role_ingest.name
  user_name = snowflake_service_user.tf_svc_ingest.name

  depends_on = [snowflake_service_user.tf_svc_ingest]
}

resource "tls_private_key" "tf_ext_dbt_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "snowflake_service_user" "tf_ext_dbt" {
  provider          = snowflake.useradmin
  name              = "TF_EXT_DBT"
  default_role      = snowflake_account_role.tf_role_dbt.name
  default_warehouse = snowflake_warehouse.tf_dbt.name
  default_namespace = "${snowflake_database.tf_platform.name}.${snowflake_schema.tf_platform_dbt_runtime.name}"
  rsa_public_key = replace(
    tls_private_key.tf_ext_dbt_key.public_key_pem,
    "/-----BEGIN PUBLIC KEY-----|-----END PUBLIC KEY-----|\\s/",
    ""
  )
}

resource "snowflake_grant_account_role" "tf_role_dbt_to_tf_ext_dbt" {
  provider  = snowflake.useradmin
  role_name = snowflake_account_role.tf_role_dbt.name
  user_name = snowflake_service_user.tf_ext_dbt.name

  depends_on = [snowflake_service_user.tf_ext_dbt]
}

resource "tls_private_key" "tf_ext_bi_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "snowflake_service_user" "tf_ext_bi" {
  provider          = snowflake.useradmin
  name              = "TF_EXT_BI"
  default_role      = snowflake_account_role.tf_role_bi.name
  default_warehouse = snowflake_warehouse.tf_bi.name
  rsa_public_key = replace(
    tls_private_key.tf_ext_bi_key.public_key_pem,
    "/-----BEGIN PUBLIC KEY-----|-----END PUBLIC KEY-----|\\s/",
    ""
  )
}

resource "snowflake_grant_account_role" "tf_role_bi_to_tf_ext_bi" {
  provider  = snowflake.useradmin
  role_name = snowflake_account_role.tf_role_bi.name
  user_name = snowflake_service_user.tf_ext_bi.name

  depends_on = [snowflake_service_user.tf_ext_bi]
}
