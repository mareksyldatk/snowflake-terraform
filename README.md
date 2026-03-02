# Snowflake Terraform Bootstrap

## Create a Service User for Terraform
Based on Snowflake’s quickstart section:  
https://www.snowflake.com/en/developers/guides/terraforming-snowflake/#create-a-service-user-for-terraform

1. Generate an RSA key pair (local machine):
```bash
cd ~/.ssh
openssl genrsa 2048 | openssl pkcs8 -topk8 -inform PEM -out snowflake_tf_snow_key.p8 -nocrypt
openssl rsa -in snowflake_tf_snow_key.p8 -pubout -out snowflake_tf_snow_key.pub
```

2. Copy the public key value for Snowflake:
```bash
awk 'NR>1 && !/END PUBLIC KEY/' ~/.ssh/snowflake_tf_snow_key.pub | tr -d '\n' | pbcopy
```

3. In Snowflake (as `ACCOUNTADMIN`), create the service user and grant roles:
```sql
USE ROLE ACCOUNTADMIN;

CREATE USER SVC_TERRAFORM
  TYPE = SERVICE
  COMMENT = 'Service user for Terraform'
  RSA_PUBLIC_KEY = '<PASTE_PUBLIC_KEY_VALUE>';

GRANT ROLE SYSADMIN TO USER SVC_TERRAFORM;
GRANT ROLE SECURITYADMIN TO USER SVC_TERRAFORM;
```

> **Security Note (Production):** `SYSADMIN` and `SECURITYADMIN` are granted here only to keep this lab simple. In production, use least-privilege role grants, and store/manage key material in a secrets manager (for example HashiCorp Vault, Azure Key Vault, or AWS Secrets Manager).

4. Get your Snowflake organization/account identifiers:
```sql
SELECT LOWER(current_organization_name()) as your_org_name, LOWER(current_account_name()) as your_account_name;
```

5. Use `SVC_TERRAFORM` + `snowflake_tf_snow_key.p8` for Terraform key-pair auth.

## Configure and Run Terraform

1. Preferred local setup: create `terraform.tfvars` from the example and fill values:
```bash
cp terraform.tfvars.example terraform.tfvars
```

```hcl
organization_name = "your_org_name"
account_name      = "your_account_name"
# Optional (defaults shown):
# user             = "SVC_TERRAFORM"
# role             = "SYSADMIN"
# private_key_path = "~/.ssh/snowflake_tf_snow_key.p8"
```

2. Run Terraform:
```bash
terraform init
terraform plan
```

> **State Note:** This repository currently uses local Terraform state (files on your machine) for simplicity. In production, move state to AWS (for example S3 backend with state locking) before team usage.

3. Optional (CI): use `TF_VAR_organization_name`, `TF_VAR_account_name`, etc., instead of `terraform.tfvars`.
