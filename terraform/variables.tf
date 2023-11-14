variable "project_id" {
  type = string
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}


variable "subnet_name" {
  type = string
}

variable "subnet_cidr" {
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

variable "node_count" {
  type = number
}

variable "nodes_per_zone" {
  type = number
}



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