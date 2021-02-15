resource "google_project" "project" {
  name = var.project_name
  project_id = var.project_id
  billing_account = var.billing_id
  org_id = var.org_id
}

resource "google_project_service" "project" {
  project = google_project.project.project_id

  for_each = toset([
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "dns.googleapis.com",
  ])

  service = each.key

  disable_on_destroy = false
}

resource "google_service_account" "project_terraform" {
  # service account for project-specific terraform
  project = google_project.project.project_id
  account_id = "terraform"
  display_name = "${var.project_name} Terraform"
  description = "Terraform service account for ${var.project_name}"
}

resource "google_service_account_key" "project_terraform" {
  service_account_id = google_service_account.project_terraform.name
}

resource "google_storage_bucket" "project_terraform" {
  # terraform state storage bucket
  project = google_project.project.project_id
  name = var.bucket_name
  location = var.region

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "project_terraform" {
  bucket = google_storage_bucket.project_terraform.name
  role = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.project_terraform.email}"
}