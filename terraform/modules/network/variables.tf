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

variable "service_accounts" {
  type = list(object({
    name = string
    description = string
    roles = list(string)
  }))
  default = [ {
    name = "service-account"
    description = "service-account"
    roles = [ "roles/firebase.admin" , "roles/iam.serviceAccountUser" ]
  } ]
}
