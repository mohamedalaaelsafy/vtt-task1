resource "google_compute_firewall" "firewall" {
  project   = var.project_id
  name      = "allow-iap"
  network   = google_compute_network.vpc.name
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_tags   = null
  source_ranges = ["35.235.240.0/20"]
  target_tags   = ["allow-iap"]
}

# resource "google_compute_firewall" "allow-vm" {
#   project   = var.project_id
#   name      = "allow-vm"
#   network   = google_compute_network.vpc.name
#   direction = "INGRESS"
#   allow {
#     protocol = "tcp"
#     ports    = ["All"]
#   }
#   source_tags   = null
#   source_ranges = ["${var.vm_internal_ip}/32"]
#   target_tags   = ["allow-vm"]
# }
