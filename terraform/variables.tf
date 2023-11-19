variable "project_id" {
  type = string
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}
variable "zone" {
  type = string
}


#============================

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "subnet_cidr_sec1" {
  type = string
}

variable "subnet_cidr_sec2" {
  type = string
}

variable "alb_ip_enabled" {
  type = bool
}
variable "alb_ip_name" {
  type = string
}

#============================

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


variable "nodes_per_zone" {
  type = number
}

variable "node_locations" {
  type        = string
  description = "node locations in the node pool"
}


variable "master_authorized_networks" {
  type = list(object({ cidr_block = string, display_name = string }))
  default = [
    {
      cidr_block   = "0.0.0.0/0"
      display_name = "Allow all"
    }
  ]
}

variable "master_node_cidr" {
  type = string  
}

#============================
variable "buckets" {
  type = list(object({
    name        = string
    description = string
    location    = string
  }))
  default = [
    {
      name        = "mhklhkj"
      description = "mhklhkj"
      location    = "europe-west6"
    },
    {
      name        = "mhklhkj"
      description = "mhklhkj"
      location    = "europe-west6"
    }
  ]
}

#============================

variable "machine_name" {
  type = string
}

variable "os_image" {
  type = string
}

variable "vm_machine_type" {
  type = string
}

#============================

variable "dataset" {
  type = list(object({
    name        = string
    description = string
  }))
}