provider "google" {
  credentials = file("~/Documents/Google-GCP-2021/GCP-ServiceAccouts/devopsvj-project/devopsvj-tf-sa/poised-climate-303823-8d82e66fede9.json")
  project = "poised-climate-303823"
  region  = "us-central1"
  zone    = "us-central1-c"
}
