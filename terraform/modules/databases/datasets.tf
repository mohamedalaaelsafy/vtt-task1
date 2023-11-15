resource "google_bigquery_dataset" "dataset" {
  count = length(var.dataset)
  dataset_id                  = var.dataset[count.index].name
  description                 = var.dataset[count.index].description
  location                    = "U" 
}