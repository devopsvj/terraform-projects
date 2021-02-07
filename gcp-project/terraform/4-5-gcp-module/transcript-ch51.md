# CHAPTER 5.1
## Using Terraform Modules

### In this lesson, we learn more about modules and how you can use them to repurpose your configuration files.

- Module to Use for the Lesson
```
module "network" {
  source  = "terraform-google-modules/network/google"
  version = "2.0.2"

  network_name = "terraform-vpc-network"
  project_id   = var.project

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = var.cidrs
      subnet_region = var.region

    },
  ]

  secondary_ranges = {
    subnet-01 = []

  }
}
```