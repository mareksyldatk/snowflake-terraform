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

variable "github_repo_url" {
  type        = string
  description = "GitHub repository URL allowed for Snowflake Git API integration"
}

variable "github_integration_name" {
  type        = string
  description = "Snowflake API integration name for Git repository access"
  default     = "TF_GITHUB_INT_SNOWFLAKE_TERRAFORM"
}
