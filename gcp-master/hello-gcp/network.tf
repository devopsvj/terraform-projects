
# create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.app_name}-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create public subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "${var.app_name}-public-subnet"
  ip_cidr_range = var.public_subnet_cidr
  network       = google_compute_network.vpc.name
  region        = var.gcp_region
}
