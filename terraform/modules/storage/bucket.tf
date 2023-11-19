module "upload_logos_bucket" {
  count =  length(var.buckets)
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  name       = var.buckets[count.index].name
  project_id = var.project_id
  location   = var.region
  versioning = false
  storage_class = "STANDARD"
}