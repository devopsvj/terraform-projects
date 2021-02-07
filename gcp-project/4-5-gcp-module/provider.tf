provider "google" {
  credentials = var.gcp_auth_file
  #credentials = file("~/Documents/Google-GCP-2021/GCP-ServiceAccouts/devopsvj-project/devopsvj-tf-sa/poised-climate-303823-8d82e66fede9.json")
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
