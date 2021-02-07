provider "google" {
  #version     = "3.5.0"
  credentials = file("~/Documents/Google-GCP-2021/GCP-ServiceAccouts/devopsvj-project/devopsvj-tf-sa/poised-climate-303823-8d82e66fede9.json")
  project     = "poised-climate-303823"
  region      = "us-central1"
  zone        = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "new-terraform-network"
}

resource "google_compute_instance" "tf-vm_instance" {
  name         = "tf-vm_instance"
  machine_type = "f1-micro"
  tags         = ["web"]
  zone         = "us-central1-c"
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }

  target_tags   = ["web"]
  source_ranges = ["0.0.0.0/0"]
}

