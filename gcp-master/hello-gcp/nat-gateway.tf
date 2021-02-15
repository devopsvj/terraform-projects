module "cloud-nat" {
  source        = "terraform-google-modules/cloud-nat/google"
  version       = "~> 1.2"
  project_id    = var.app_project
  region        = var.gcp_region
  create_router = true
  router        = "${var.app_name}-router"
  network       = google_compute_network.vpc.self_link
}

# module "cloud_router" {
#   source  = "terraform-google-modules/cloud-router/google"
#   version = "~> 0.4"
#   name    = "example-router"
#   project = var.app_project
#   region  = var.gcp_region
#   network = "default"
# }
