variable "project_name" {
  description = "Pick a Human-readable name of the project"
  type = string
}

variable "project_id" {
  description = "Pick a Project ID"
  type = string
}

variable "billing_id" {
  description = "Billing ID to attach project to"
  type = string
}

variable "org_id" {
  description = "Organization ID to attach project to"
  type = string
}

variable "region" {
  description = "Pick a region most things go into"
  type = string
}

variable "bucket_name" {
  description = "Pick a name for the terraform state storage bucket"
  type = string
}