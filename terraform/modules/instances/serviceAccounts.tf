
resource "google_project_iam_custom_role" "GS-Bucket-role" {
  role_id     = "GSBucketRole"
  title       = "GS-Bucket-Role"
  description = "Read Only"
  permissions = [
    "storage.buckets.get",
    "storage.buckets.list",
    "storage.objects.get",
    "storage.objects.list",
  ]
}
module "gs-buckets-sa" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = var.project_id
  names         = ["gs-buckets-sa"]
  # prefix = "gs"
  project_roles = [
   "${var.project_id}=>projects/${var.project_id}/roles/GSBucketRole",
  ]
  depends_on = [ google_project_iam_custom_role.GS-Bucket-role ]
}

resource "google_project_iam_custom_role" "BQ-role" {
  role_id     = "BQrole"
  title       = "BQ-Role"
  description = "Read and Write to BigQuery without delete permission"
  permissions = [
    "bigquery.datasets.get",
    "bigquery.models.export",
    "bigquery.models.getData",
    "bigquery.models.getMetadata",
    "bigquery.models.list",
    "bigquery.routines.get",
    "bigquery.routines.list",
    "bigquery.routines.update",
    "bigquery.routines.updateTag",
    "bigquery.tables.create",
    "bigquery.tables.createSnapshot",
    "bigquery.tables.export",
    "bigquery.tables.get",
    "bigquery.tables.getData",
    "bigquery.tables.getIamPolicy",
    "bigquery.tables.list",
    "bigquery.tables.replicateData",
    "bigquery.tables.restoreSnapshot",
    "bigquery.tables.update",
    "bigquery.tables.updateData",
    "bigquery.tables.updateTag",
    "resourcemanager.projects.get"
  ]
}

module "bq-datasets-sa" {
  source        = "terraform-google-modules/service-accounts/google"
  version       = "~> 3.0"
  project_id    = var.project_id
  names         = ["bigquey-datasets-sa"]
  # prefix = "bq"
  project_roles = [
    "${var.project_id}=>projects/${var.project_id}/roles/BQrole"
  ]
  depends_on = [ google_project_iam_custom_role.BQ-role ]
}