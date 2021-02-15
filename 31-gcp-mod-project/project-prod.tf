module "prod" {
  source = "../modules/project"

  billing_id = var.billing_id
  org_id = var.org_id
  region = var.region

  project_name = "Production"
  project_id = "<input a project ID>"
  bucket_name = "<pick a name for the bucket>"
}