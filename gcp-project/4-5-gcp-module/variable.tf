variable "gcp_auth_file" {
  type    = string
  default = "~/Documents/Google-GCP-2021/GCP-ServiceAccouts/devopsvj-project/devopsvj-tf-sa/poised-climate-303823-8d82e66fede9.json"
}

variable "gcp_project" {
  type    = string
  default = "poised-climate-303823"
}

variable "gcp_region" {
  type    = string
  default = "us-central1"
}

variable "gcp_zone" {
  type    = string
  default = "us-central1-c"
}

variable "gcp_cidr" {
  default = "10.0.0.0/16"
}