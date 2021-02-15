module "dev" {
  source = "../modules/project"

  billing_id = var.billing_id
  org_id = var.org_id
  region = var.region

  project_name = "Development"
  project_id = "<pick a project ID>"
  bucket_name = "<pick a name for the bucket>"
}