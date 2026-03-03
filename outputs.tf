output "managed_service_users" {
  value = {
    ingest = snowflake_service_user.tf_svc_ingest.name
    dbt    = snowflake_service_user.tf_ext_dbt.name
    bi     = snowflake_service_user.tf_ext_bi.name
  }
}

output "managed_service_user_public_keys" {
  value = {
    TF_SVC_INGEST = tls_private_key.tf_svc_ingest_key.public_key_pem
    TF_EXT_DBT    = tls_private_key.tf_ext_dbt_key.public_key_pem
    TF_EXT_BI     = tls_private_key.tf_ext_bi_key.public_key_pem
  }
}

output "github_integration_name" {
  value = var.github_integration_name
}
