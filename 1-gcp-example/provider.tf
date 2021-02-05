provider "google" {
  credentials = file("/<DIR_PATH>/<Service_Account_File_Name>.json")
  project = "<Project_ID>"
  region  = "us-central1"
  zone    = "us-central1-c"
}

# provider "google" {
#   credentials = file(var.gcp_auth_file)
#   project = "<Project_ID>"
#   region  = "us-central1"
#   zone    = "us-central1-c"
# }
