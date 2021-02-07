module "network_fabric-net-firewall" {
  source = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  #version = "1.1.0"
  project_id              = var.gcp_project
  network                 = module.network.network_name
  internal_ranges_enabled = true
  internal_ranges         = var.gcp_cidr
}