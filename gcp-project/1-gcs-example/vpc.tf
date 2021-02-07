resource "google_compute_network" "vpc_network" {
  name = "devopsvj-tf-network"
  description = "devopsvj-proj-vpc-network"
  auto_create_subnetworks = false
}

output "vpc_network_out" {
    description = "The devopsvj-proj-vpc-network VPC Id"
    value = google_compute_network.vpc_network.id
}