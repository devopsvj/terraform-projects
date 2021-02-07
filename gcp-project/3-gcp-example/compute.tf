#GCP Compute Instance:

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  
//   tags = [
//       Name = "gcp-tf-vm-instance1",
//       Dept = "Training",
//       Created_By = "Iac"
//   ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }

}

resource "google_compute_address" "static_ip" {
  name = "terraform-static-ip"
}

#Output template:

output "ip" {
  value = google_compute_address.static_ip.address
}
