module "network" {
  source = "terraform-google-modules/network/google"
  #version = "1.1.0"
  network_name = "terraform-vpc-network"
  project_id   = var.gcp_project

  subnets = [
    {
      subnet_name   = "tf-subnet-dev-01"
      subnet_ip     = var.gcp_cidr
      subnet_region = var.gcp_region
    },
  ]

  secondary_ranges = {
    subnet-01 = []
  }
}