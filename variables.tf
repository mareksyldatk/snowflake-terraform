############################################
# Snowflake Provider Setup
############################################

variable "organization_name" {
  type        = string
  description = "Snowflake organization name"
}

variable "account_name" {
  type        = string
  description = "Snowflake account name"
}

variable "user" {
  type        = string
  description = "Snowflake service user"
  default     = "SVC_TERRAFORM"
}

variable "private_key_path" {
  type        = string
  description = "Path to Snowflake RSA private key"
  default     = "~/.ssh/snowflake_tf_snow_key.p8"
}

variable "public_key_path" {
  type        = string
  description = "Path to Snowflake RSA public key"
  default     = "~/.ssh/snowflake_tf_snow_key.pub"
}

############################################
# Git Integration Setup
############################################

variable "github_username" {
  type        = string
  description = "GitHub username for Snowflake Git credentials"
}

variable "github_token" {
  type        = string
  description = "GitHub PAT for Snowflake Git credentials"
  sensitive   = true
}
