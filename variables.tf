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

variable "role" {
  type        = string
  description = "Snowflake role for data-plane resources (databases/warehouses)"
  default     = "SYSADMIN"
}

variable "useradmin_role" {
  type        = string
  description = "Snowflake role for account-level security resources (roles/grants)"
  default     = "USERADMIN"
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
