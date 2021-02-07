# Resource GCP provider

provider "google" {
  #version     = "3.5.0"
  credentials = var.gcp_auth_file
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}

# Resource VPN network

resource "google_compute_network" "auto_vpc_network" {
  name = "auto-terraform-network"
}

# Resource auto scaler

resource "google_compute_autoscaler" "foobar" {
  name   = "my-autoscaler"
  project = var.gcp_project
  zone   = var.gcp_zone
  target = google_compute_instance_group_manager.foobar.self_link

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

# Resource instance_template

resource "google_compute_instance_template" "foobar" {
  name           = "my-instance-template"
  machine_type   = "n1-standard-1"
  can_ip_forward = false
  project = var.gcp_project
  tags = ["foo", "bar", "allow-lb-service"]

  disk {
    source_image = data.google_compute_image.centos_7.self_link
  }

  network_interface {
    network = "default"
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

# Resource target_pool

resource "google_compute_target_pool" "foobar" {
  name = "my-target-pool"
  project = var.gcp_project
  region = var.gcp_region
}

# Resource instance_group_manager

resource "google_compute_instance_group_manager" "foobar" {
  name = "my-igm"
  zone = var.gcp_zone
  project = var.gcp_project

  version {
    instance_template  = google_compute_instance_template.foobar.self_link
    name               = "primary"
  }

  target_pools       = [google_compute_target_pool.foobar.self_link]
  base_instance_name = "terraform"
}

# Image Data Module

data "google_compute_image" "centos_7" {
  family  = "centos-7"
  project = "centos-cloud"
}

#Load Balancer Module
module "lb" {
  source  = "GoogleCloudPlatform/lb/google"
  version = "2.2.0"
  region       = var.gcp_region
  name         = "load-balancer"
  service_port = 80
  target_tags  = ["my-target-pool"]
  network      = google_compute_network.auto_vpc_network.name
}



