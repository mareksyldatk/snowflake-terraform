resource "snowflake_database" "tf_platform" {
  name         = "TF_PLATFORM"
  is_transient = false
}

resource "snowflake_database" "tf_bronze" {
  name         = "TF_BRONZE"
  is_transient = false
}

resource "snowflake_database" "tf_silver" {
  name         = "TF_SILVER"
  is_transient = false
}

resource "snowflake_database" "tf_golden" {
  name         = "TF_GOLDEN"
  is_transient = false
}
