variable "project" {
  description = "The name of the admin project"
  type = string
  default = "<name of your admin project>"
}

variable "region" {
  description = "Region where most things are being created"
  type = string
  default = "us-central1"
}

variable "zone" {
  description = "Zone where resources are created"
  type = string
  default = "us-central1-a"
}

variable "org_id" {
  description = "Organization ID under which all projects are created"
  type = string
  default = "<your Organization ID>"
}

variable "billing_id" {
  description = "Billing account ID to attach projects to"
  type = string
  default = "<your Billing account ID>"
}