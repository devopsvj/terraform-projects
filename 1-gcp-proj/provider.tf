provider "google" {
  version = "~> 3.5.0"
  credentials = file("/<DIR_PATH>/<Service_Account_File_Name>.json")
  project = "<Project_ID>"
  region  = "us-central1"
  zone    = "us-central1-c"
}
