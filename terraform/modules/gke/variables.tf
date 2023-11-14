variable "project_id" {
  type = string
}


variable "cluster_name" {
  type = string
}

variable "cluster_region" {
  type = string
}

variable "cluster_zones" {
  type = list(string)
}

variable "machine_type" {
  type = string
}

variable "node_count" {
  type = number
}

variable "nodes_per_zone" {
  type = number
}

variable "subnet_name" {
  type = string
}

variable "vpc_name" {
  type = string
}
