# Snowflake Terraform Bootstrap

## References
- Example TF project: https://www.snowflake.com/en/developers/guides/terraforming-snowflake/#create-a-service-user-for-terraform
- Terraform Snowflake provider docs: https://docs.snowflake.com/en/user-guide/terraform
- API integration provider note: https://registry.terraform.io/providers/snowflakedb/snowflake/latest/docs/resources/api_integration

## Repository Structure
- `env/prod`: runnable Terraform root for the PROD environment.
- `modules/core`: Snowflake databases, schemas, and warehouses.
- `modules/security`: roles, grants, and service users.
- `modules/integrations`: Git secret + SQL-based API integration setup.

## Create a Service User for Terraform
Bootstrap one operator user (for providers), for example `SVC_TERRAFORM`, with key-pair auth.

```sql
SELECT LOWER(current_organization_name()) as your_org_name,
       LOWER(current_account_name()) as your_account_name;
```

Use those values in `env/prod/terraform.tfvars`.

## Configure and Run (PROD)
```bash
cd env/prod
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
terraform apply
```

`env/prod/terraform.tfvars` is pre-created from the previous root `terraform.tfvars` during refactor.

## Git Integration
Git integration is created with `snowflake_execute` because `git_https_api` is not yet supported in `snowflake_api_integration` resource.

Set:
- `github_repo_url`
- `github_integration_name`
- `github_username`
- `github_token`

Current bootstrap URL points to this Terraform repo; replace it later with your dbt repo.

## Production Notes
- Apply least-privilege role grants; keep bootstrap admin access minimal.
- `tls_private_key` stores private keys in Terraform state (acceptable for lab/dev, avoid in prod).
- Move state/backend to AWS for team usage (for example S3 + locking).
- `private_key_path` is acceptable for local operator use. For production CI, prefer a sensitive `private_key_pem` input sourced at runtime from AWS Secrets Manager instead of relying on a file path.
- Store secrets and key material in Vault / Azure Key Vault / AWS Secrets Manager.

## Production Setup

### Secrets Management

Recommended production flow:
- Create only the AWS Secrets Manager secret container in Terraform.
- Add the Snowflake private key value to that secret outside Terraform, for example via AWS Console, AWS CLI, or CI bootstrap.
- Store the full PEM value, including `-----BEGIN PRIVATE KEY-----` and `-----END PRIVATE KEY-----`.
- Do not manage `aws_secretsmanager_secret_version.secret_string` in Terraform if you want to keep the private key out of Terraform state.

Example pattern for AWS:

```hcl
resource "aws_secretsmanager_secret" "snowflake_private_key" {
  name = "snowflake/private-key"
}
```

### Provider Change

For local use, the current provider config can continue using:

```hcl
private_key = file(pathexpand(var.private_key_path))
```

For production, do not point Terraform at a local file on the runner if AWS Secrets Manager is your source of truth.
`aws_secretsmanager_secret.snowflake_private_key` gives you the secret container, not the secret value, so it cannot be used directly as `private_key`.

If Terraform itself must read the secret, the pattern looks like this:

```hcl
resource "aws_secretsmanager_secret" "snowflake_private_key" {
  name = "snowflake/private-key"
}

data "aws_secretsmanager_secret_version" "snowflake_private_key" {
  secret_id = aws_secretsmanager_secret.snowflake_private_key.id
}
```

```hcl
provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  role              = "SYSADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = data.aws_secretsmanager_secret_version.snowflake_private_key.secret_string
}
```

This works, but the private key value passes through Terraform and **may be recorded in state as sensitive** data.

Safer production approach: fetch the secret in CI outside Terraform and pass it in as a sensitive variable.

```hcl
variable "private_key_pem" {
  type        = string
  sensitive   = true
  description = "Snowflake RSA private key in PEM format"
}
```

```hcl
provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  role              = "SYSADMIN"
  authenticator     = "SNOWFLAKE_JWT"
  private_key       = var.private_key_pem
}
```

Example CI shell command:

```bash
export TF_VAR_private_key_pem="$(aws secretsmanager get-secret-value \
  --secret-id snowflake/private-key \
  --query SecretString \
  --output text)"
```

Then run Terraform normally:

```bash
terraform plan
terraform apply
```

This keeps the key out of `terraform.tfvars` and avoids relying on a local file path.
