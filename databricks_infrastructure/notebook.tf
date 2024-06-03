variable "notebook_subdirectory" {
  description = "This subdirectory will contain all specified content."
  type        = string
  default     = "Terraform"
}

variable "notebook_filename" {
  description = "The notebook's filename."
  type        = string
}

variable "notebook_language" {
  description = "The user's preferred programming language for the notebook."
  type        = string
}

resource "databricks_notebook" "this" {
  path     = "${data.databricks_current_user.user.home}/${var.notebook_subdirectory}/${var.notebook_filename}"
  language = var.notebook_language
  source   = "./${var.notebook_filename}"
}

output "notebook_url" {
  value = databricks_notebook.this.url
}
