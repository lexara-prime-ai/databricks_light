variable "databricks_host" {
  description = "Databricks workspace URL"
  type        = string
  default     = "" # https://<databricks-instance>.databricks.com
}

variable "user" {
  description = "User email."
  type        = string
  sensitive   = true
}

variable "password" {
  description = "User password."
  type        = string
  sensitive   = true
}
