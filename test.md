# CHAPTER 6.1

## Defining Your Network Variables

## In this lesson, we define our network variables in our main.tf file.

- Template to Download

```
module "network" {
  source  = "terraform-google-modules/network/google"
  version = "1.1.0"
  network_name = "terraform-vpc-network"
  project_id   =

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     =
      subnet_region =
    },
  ]

  secondary_ranges = {
    subnet-01 = []
  }
}

```
-------------------------------------
## Here is the variable.tf template:

- Template to Download

```
variable "project" {
  default = 
}

variable "region" {
  default = "us-central1" 
}

variable "zone"  {
  default = "us-central1-c"
}

variable "cidr_ip" {
  default = "10.0.0.0/16"
}
```
