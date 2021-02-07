# CHAPTER 6.2

## Creating Firewalls and Associated Rules

## In this lesson, we go over how to use a firewall module to create firewall rules.

- Template

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
-------------------------------------------------
```    
module "network_fabric-net-firewall" {
  source  = "terraform-google-modules/network/google//modules/fabric-net-firewall"
  version = "1.1.0"
  project_id              = 
  network                 = 
  internal_ranges_enabled = true
  internal_ranges         = 

}

```