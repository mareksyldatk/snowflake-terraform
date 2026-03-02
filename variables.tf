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
  description = "Snowflake role for provider operations"
  default     = "SYSADMIN"
}

variable "private_key_path" {
  type        = string
  description = "Path to Snowflake RSA private key"
  default     = "~/.ssh/snowflake_tf_snow_key.p8"
}
