# CHAPTER 3.4
## Setting Up Remote State in Cloud Storage

### In this lesson, we set up a remote state for Terraform in Google Cloud Storage.

- Template:

```
provider "google" {
  version = "3.5.0"

  credentials = file("terraform-key.json")

  project = 
  region  = 
  zone    = ""
}

```
-----------------------------------------
```
resource "google_compute_network" "vpc_network" {
  name = "new-terraform-network"
}
```
---------------------
```
terraform {
  backend "gcs" {
    bucket = "tf-state-prod"
    prefix = "terraform/state"
    
   }
}
````
