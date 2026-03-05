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
