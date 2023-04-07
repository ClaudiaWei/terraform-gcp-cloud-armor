provider "google" {
  project = var.project
  zone    = var.zone
}

terraform {
  required_providers {
    google = {
      version = "~> 4.0"
    }
  }

  backend "gcs" {}
}
