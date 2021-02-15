# define the GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}

# define GCP project name
variable "app_project" {
  type        = string
  description = "GCP project name"
}

# define application name
variable "app_name" {
  type        = string
  description = "Application name"
}

# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

# define GCP zone
variable "gcp_zone" {
  type        = string
  description = "GCP zone"
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "GCP VM instance machine type."
  type        = string
  default     = "f1-micro"
}

variable "labels" {
  description = "List of labels to attach to the VM instance."
  type        = map(any)
}

# define Public subnet
variable "public_subnet_cidr" {
  type        = string
  description = "Public subnet CIDR 1"
}

# define application domain
variable "app_domain" {
  type        = string
  description = "Application domain"
}
variable "gce_ssh_user" {
  type        = string
  description = "SSH username"
}
variable "gce_ssh_pub_key_file" {
  type        = string
  description = "SSH public key file"
}

## define application environment
#variable "app_environment" {
#  type        = string
#  description = "Application environment"
#}
