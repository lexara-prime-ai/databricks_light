provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_repository" "databricks_light" {
  name        = "databricks_light"
  description = "A basic terraform template based on the databricks/databricks-terraform examples."
  visibility  = "public"
}
