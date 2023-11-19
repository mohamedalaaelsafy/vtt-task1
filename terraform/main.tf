module "network" {
  source           = "./modules/network"
  project_id       = "vodafone-technical-task"
  env              = var.env
  region           = var.region
  vpc_name         = var.vpc_name
  subnet_name      = var.subnet_name
  subnet_cidr      = var.subnet_cidr
  subnet_cidr_sec1 = var.subnet_cidr_sec1
  subnet_cidr_sec2 = var.subnet_cidr_sec2
  alb_ip_enabled   = var.alb_ip_enabled
  alb_ip_name      = var.alb_ip_name
}

module "gke" {
  source                     = "./modules/gke"
  project_id                 = var.project_id
  subnet_name                = module.network.subnet_name
  vpc_name                   = module.network.vpc_name
  cluster_name               = var.cluster_name
  master_node_cidr = var.master_node_cidr
  subnet_cidr_sec1           = module.network.subnet_cidr_sec1
  subnet_cidr_sec2           = module.network.subnet_cidr_sec2
  cluster_region             = var.cluster_region
  cluster_zones              = var.cluster_zones
  machine_type               = var.machine_type
  nodes_per_zone             = var.nodes_per_zone
  node_locations             = var.node_locations
  master_authorized_networks = var.master_authorized_networks
}

module "storage" {
  source     = "./modules/storage"
  buckets    = var.buckets
  project_id = var.project_id
  region     = var.region
}

module "instances" {
  source          = "./modules/instances"
  machine_name    = var.machine_name
  vm_machine_type = var.vm_machine_type
  os_image        = var.os_image
  network_name    = module.network.vpc_name
  subnet_name     = module.network.subnet_name
  zone            = var.zone
  region          = var.region
  project_id      = var.project_id
}

module "databases" {
  source  = "./modules/databases"
  dataset = var.dataset
}