output "subnet_name" {
  value = google_compute_subnetwork.subnet.name
}

output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "gs-buckets-sa" {
  value = module.gs-buckets-sa.email
}

output "bigquey-datasets-sa" {
  value = module.bigquey-datasets-sa.email
}