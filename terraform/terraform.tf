terraform {
  backend "gcs" {
    bucket = "kube-terraform-bucket"
    prefix = "dev"
  }
}

provider "google" {
  project = "vodafone-technical-task"
  region  = "us-central1"
}