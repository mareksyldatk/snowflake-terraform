# Permissions Model

High-level role intent:

- `TF_ROLE_INGEST`: ingest warehouse + bronze write/select.
- `TF_ROLE_DBT`: transformation runtime privileges across bronze/silver/golden/platform.
- `TF_ROLE_BI`: read-only analytics access on curated layers.

Detailed grants are defined in `modules/security/grants_*.tf`.
