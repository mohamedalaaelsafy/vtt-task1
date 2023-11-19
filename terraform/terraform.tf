terraform {
  backend "gcs" {
    bucket = "kube-terraform-bucket"
    prefix = "vtt-task1"
  }
}

provider "google" {
  project = "vodafone-technical-task"
  region  = "us-central1"
}

