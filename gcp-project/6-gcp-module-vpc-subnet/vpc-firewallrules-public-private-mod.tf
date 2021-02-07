module "network" {
  source = "terraform-google-modules/network/google"
  #version = "1.1.0"
  network_name = "my-vpc-network"
  project_id   = var.gcp_project

  subnets = [
    {
      subnet_name   = "tf-subnet-dev-01"
      subnet_ip     = var.gcp_cidr
      subnet_region = var.gcp_region
    },
    // {
    //   subnet_name   = "tf-subnet-dev-02"
    //   subnet_ip     = "10.0.0.0/16"
    //   subnet_region = var.gcp_region
    //   google_private_access = "true"
    // },
  ]

  secondary_ranges = {
    subnet-01 = []
  }
}

module "network_routes" {
  source  = "terraform-google-modules/network/google//modules/routes"
  #version = "2.1.1"
  network_name = module.network.network_name
  project_id   = var.gcp_project
  
   routes = [
         {
             name                   = "egress-internet"
             description            = "route through IGW to access internet"
             destination_range      = "0.0.0.0/0"
             tags                   = "egress-inet"
             next_hop_internet      = "true"
         },
       
     ]
}

module "network_fabric-net-firewall" {
  source = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  #version = "1.1.0"
  project_id              = var.gcp_project
  network                 = module.network.network_name
  internal_ranges_enabled = true
  #internal_ranges         = [var.gcp_cidr]
  internal_ranges         = ["10.0.0.0/16"]
}