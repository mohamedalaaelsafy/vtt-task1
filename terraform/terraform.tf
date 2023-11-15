terraform {
  backend "gcs" {
    bucket = "kube-terraform-bucket"
    prefix = "env"
  }
}

provider "google" {
  project = "vodafone-technical-task"
  region  = "us-central1"
}