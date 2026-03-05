# Architecture Overview

This project provisions a Snowflake data platform baseline for a PROD environment.

- `modules/core`: foundational data objects (DBs, schemas, warehouses).
- `modules/security`: RBAC model and service principals.
- `modules/integrations`: Git integration bootstrap resources.

Environment composition is in `env/prod`.
