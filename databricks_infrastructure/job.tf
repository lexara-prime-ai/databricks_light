variable "job_name" {
  description = "The default job name."
  type        = string
  default     = "Hourly Terraform Job"
}

variable "task_key" {
  description = "The default task name."
  type        = string
  default     = "Initial Hourly Job Task"
}

resource "databricks_job" "this" {
  name = var.job_name
  task {
    task_key            = var.task_key
    existing_cluster_id = databricks_cluster.this.cluster_id
    notebook_task {
      notebook_path = databricks_notebook.this.path
    }
  }
  email_notifications {
    on_success = [data.databricks_current_user.user.user_name]
    on_failure = [data.databricks_current_user.user.user_name]
  }
}

output "job_url" {
  value = databricks_job.this.url
}
