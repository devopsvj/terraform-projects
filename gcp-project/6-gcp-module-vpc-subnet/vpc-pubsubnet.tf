provider "google" {
  #version     = "3.5.0"
  credentials = file("~/Documents/Google-GCP-2021/GCP-ServiceAccouts/devopsvj-project/devopsvj-tf-sa/poised-climate-303823-8d82e66fede9.json")
  project     = "poised-climate-303823"
  region      = "us-central1"
  zone        = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}
resource "google_compute_subnetwork" "public-subnetwork" {
  name          = "terraform-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}