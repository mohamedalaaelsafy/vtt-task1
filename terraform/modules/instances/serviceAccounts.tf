module "gs-buckets-sa" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = var.project_id
  names         = ["gs-buckets-sa"]
  project_roles = [
    "${var.project_id}=>storage.buckets.list"
  ]
}

module "bigquey-datasets-sa" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = var.project_id
  names         = ["bigquey-datasets-sa"]
  project_roles = [
    "${var.project_id}=>bigquery.datasets.create",
    "${var.project_id}=>bigquery.datasets.get"
  ]
}

