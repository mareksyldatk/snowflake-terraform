output "integration_name" {
  value = var.github_integration_name
}

output "secret_fully_qualified_name" {
  value = "${var.platform_database_name}.${var.platform_security_schema_name}.${snowflake_secret_with_basic_authentication.tf_github_pat_secret.name}"
}
