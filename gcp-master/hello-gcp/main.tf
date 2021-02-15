terraform {
  required_version = ">= 0.12"
  #required_providers {
  #  google = {
  #    source  = "hashicorp/google"
  #    version = "3.5.0"
  #  }
  #  google-beta = {
  #    version = ">= 2.7.0"
  #  }
  #}
}

provider "google" {
  credentials = file(var.gcp_auth_file)

  project = var.app_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
