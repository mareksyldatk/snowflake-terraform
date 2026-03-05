variable "github_username" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "github_repo_url" {
  type = string
}

variable "github_integration_name" {
  type = string
}

variable "platform_database_name" {
  type = string
}

variable "platform_security_schema_name" {
  type = string
}
