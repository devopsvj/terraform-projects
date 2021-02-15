# GCP Settings https://cloud.google.com/compute/docs/regions-zones#available
gcp_region          = "us-central1"
gcp_zone            = "us-central1-a"
app_project         = "XXXXXXX"
app_name            = "hello"
app_domain          = "xxxx.net"
gcp_auth_file       = "<file.json>"

# SSH
gce_ssh_user         = "debian"
gce_ssh_pub_key_file = "../secrets/xxx.pub"

# GCP Netwok
public_subnet_cidr   = "172.16.20.0/24"

labels               = {
    "environment" = "test"
    "team"        = "xxxx"
    "application" = "hello"
}
