resource "random_id" "instance_id" {
  byte_length = 8
}

module "mig" {
  #source           = "../../../modules/mig"
  source            = "git::https://github.com/terraform-google-modules/terraform-google-vm.git//modules/mig"
  project_id        = var.app_project
  region            = var.gcp_region
  target_size       = 1
  instance_template = module.instance_template.self_link
  hostname          = "${var.app_name}vm-${random_id.instance_id.hex}"
  #hostname          = "${var.app_name}vm-${random_id.instance_id.hex}.${var.app_domain}"
}
