provider "google" {
  project = var.project
  zone    = var.zone
}

terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    google = {
      version = "~> 4.0"
    }
  }

  backend "gcs" {}
}
