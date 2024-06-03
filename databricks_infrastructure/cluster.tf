variable "cluster_name" {
  description = "The cluster's name."
  type        = string
  default     = "Initial Terraform Cluster"
}

variable "cluster_autotermination_minutes" {
  description = "How long it'll take a cluster to terminate due to inactivity."
  type        = number
  default     = 15
}

variable "cluster_num_workers" {
  description = "Total number of workers."
  type        = number
  default     = 1
}

data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "this" {
  cluster_name            = var.cluster_name
  node_type_id            = data.databricks_node_type.smallest.id
  spark_version           = data.databricks_spark_version.latest_lts.id
  autotermination_minutes = var.cluster_autotermination_minutes
  num_workers             = var.cluster_num_workers
}

output "cluster_url" {
  value = databricks_cluster.this.url
}
