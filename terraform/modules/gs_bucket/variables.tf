variable "project_id" {
  type = string
}

variable "region" {
  type = string
}
variable "buckets" {
  type = list(object({
    name = string
    description = string
    location = string
  }))
}