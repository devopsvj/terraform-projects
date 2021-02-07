# CHAPTER 4.1

## Understanding `terraform init`

### In this lesson, we go over the power of using terraform init.

- Template
```
provider "google" {
  version = "3.5.0"
  credentials = file(".json")
  project = ""
  region  = "us-central1"
  zone    = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

terraform {
  backend "gcs" {
    bucket  = "tf-state-prod"
    prefix  = "terraform/state"
  }
}

```