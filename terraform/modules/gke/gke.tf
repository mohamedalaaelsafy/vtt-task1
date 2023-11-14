resource "google_project_service" "gke" {
  project            = var.project_id
  service            = "container.googleapis.com"
  disable_on_destroy = true
}


module "gke" {
  source                          = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version                         = "29.0.0"
  project_id                      = var.project_id
  name                            = var.cluster_name
  region                          = var.cluster_region
  zones                           = var.cluster_zones
  network                         = var.vpc_name
  regional                        = false
  subnetwork                      = var.subnet_name
  ip_range_pods                   = null
  ip_range_services               = null
  create_service_account          = false
  http_load_balancing             = true
  remove_default_node_pool        = true
  network_policy                  = false
  horizontal_pod_autoscaling      = false
  enable_vertical_pod_autoscaling = false
  enable_private_nodes            = true
  enable_private_endpoint         = true
  # master_authorized_networks      = var.master_authorized_networks
  filestore_csi_driver = false
  service_account      = module.acr-sa.email
  node_pools = [
    {
      name               = "node-pool"
      machine_type       = var.machine_type
      node_locations     = "europe-west6-a"
      autoscaling        = false
      node_count         = var.node_count
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = 20
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      auto_repair        = false
      auto_upgrade       = false
      preemptible        = false
      initial_node_count = var.nodes_per_zone
    },
  ]
  node_pools_tags = { all = [""] }
  depends_on      = [google_project_service.gke]
}