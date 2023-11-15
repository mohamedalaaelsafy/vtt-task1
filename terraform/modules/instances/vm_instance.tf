resource "google_compute_instance" "default" {
  name         = var.machine_name
  machine_type = var.vm_machine_type
  zone         = var.zone

  tags = ["allow-iap"]

  boot_disk {
    initialize_params {
      image = var.os_image
      type = "pd-balanced"
      size = 20
    }
  }
  network_interface {
    network = var.network_name
    subnetwork = var.subnet_name
    access_config {}
  }

  service_account {
    email  = module.gs-buckets-sa.email
    scopes = ["cloud-platform"]
  }
}