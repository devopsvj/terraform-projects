terraform {
  backend "gcs" {
    credentials = "<path to your credentials.json>"
    bucket  = "<name-of-the-bucket-you-created>"
    prefix  = "terraform/tfstate"
  }
}

provider "google" {
  credentials = "<path to your credentials.json>"
  project     = var.project
  region      = var.region
  zone        = var.zone
}