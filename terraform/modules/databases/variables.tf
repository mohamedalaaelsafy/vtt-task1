variable "dataset" {
  type = list(object({
    name = string
    description = string
  }))
}