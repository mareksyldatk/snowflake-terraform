variable "database_names" {
  type = object({
    platform = string
    bronze   = string
    silver   = string
    golden   = string
  })
}

variable "schema_names" {
  type = object({
    bronze_bronze           = string
    silver_dimensions       = string
    silver_facts            = string
    golden_dataset          = string
    platform_security       = string
    platform_integration    = string
    platform_dbt_runtime    = string
    platform_dbt_deployment = string
  })
}

variable "warehouse_names" {
  type = object({
    ingest = string
    dbt    = string
    bi     = string
  })
}

variable "github_integration_name" {
  type = string
}

variable "github_secret_fqn" {
  type = string
}
