output "snowflake_svc_public_key" {
  value = file(pathexpand(var.public_key_path))
}

output "snowflake_svc_private_key" {
  value     = file(pathexpand(var.private_key_path))
  sensitive = true
}
