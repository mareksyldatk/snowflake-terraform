output "database_names" {
  value = module.core.database_names
}

output "warehouse_names" {
  value = module.core.warehouse_names
}

output "managed_service_users" {
  value = module.security.managed_service_users
}

output "managed_service_user_public_keys" {
  value = module.security.managed_service_user_public_keys
}

output "github_integration_name" {
  value = module.integrations.integration_name
}
