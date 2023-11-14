module "network" {
  source      = "./modules/network"
  project_id  = "vodafone-technical-task"
  env         = var.env
  region      = var.region
  vpc_name    = var.vpc_name
  vpc_cidr    = var.vpc_cidr
  subnet_name = var.subnet_name
  subnet_cidr = var.subnet_cidr
}

module "gke" {
  source         = "./modules/gke"
  project_id     = var.project_id
  subnet_name    = module.network.subnet_name
  vpc_name       = module.network.vpc_name
  cluster_name   = var.cluster_name
  cluster_region = var.cluster_region
  cluster_zones  = var.cluster_zones
  machine_type   = var.machine_type
  node_count     = var.node_count
  nodes_per_zone = var.nodes_per_zone
}

module "gcs-bucket" {
  source     = "./modules/gs_bucket"
  buckets    = var.buckets
  project_id = var.project_id
  region     = var.region
}