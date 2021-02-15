
## Create static IP
resource "google_compute_global_address" "default" {
  name = "hello-external-ip"
}

# Create DNS entry
## https://github.com/terraform-google-modules/terraform-google-cloud-dns
module "dns-private-zone" {
  source     = "terraform-google-modules/cloud-dns/google"
  version    = "3.0.0"
  project_id = var.app_project
  type       = "public"
  name       = replace(var.app_domain, ".", "-")
  domain     = "${var.app_domain}."

  private_visibility_config_networks = [
    #"https://www.googleapis.com/compute/v1/projects/my-project/global/networks/my-vpc"
    google_compute_network.vpc.self_link
  ]

  recordsets = [
    {
      #name = "hello.pvss.net"
      name = var.app_name
      type = "A"
      ttl  = 300
      records = [
        #google_compute_global_address.default.address,
        module.gce-lb-http.external_ip,
      ]
    },
  ]
}
