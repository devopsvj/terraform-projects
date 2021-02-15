#resource "google_compute_address" "ip_address" {
#  name = "external-ip"
#}

# https://stackoverflow.com/a/65164037
# https://serverfault.com/q/1012815
# https://lincolnloop.com/blog/provision-cluster-google-cloud-terraform/
# https://foghornconsulting.com/2016/10/19/infrastructure-as-code-in-google-cloud/
# https://jayan-menon.medium.com/static-ip-addresses-in-a-gcp-managed-instance-group-8cce1d085075

# https://github.com/tweag/blog-resources
# https://github.com/steinim/gcp-terraform-workshop
# https://medium.com/slalom-technology/a-complete-gcp-environment-with-terraform-c087190366f0


# https://github.com/mesoform/terraform-infrastructure-modules/blob/main/gcp-swarm/terraform/main.tf
# https://github.com/tranquilitybase-io/tf-gcp-forward-proxy-service
# https://github.com/tranquilitybase-io/tf-gcp-forward-proxy-service/blob/master/mig.tf
# https://github.com/cts-terraform-modules/terraform-google-lb-http/blob/master/examples/mig-nat-http-lb/main.tf
# https://github.com/GoogleCloudPlatform/ai-notebooks-extended/blob/main/dataproc-hub-example/build/infrastructure-builder/mig/modules/mig_jupyterhub/main.tf
# https://github.com/rlizano19/terraform/blob/main/learn-terraform-sensitive-variables/main.tf
# https://github.com/boltops-tools/terraspace-google-vm/blob/master/app/stacks/vm/main.tf

# https://github.com/search?l=HCL&o=desc&p=5&q=%22..%2F..%2F..%2Fmodules%2Finstance_template%22&s=indexed&type=Code


## This startup script creates a web server application used for testing
data "template_file" "instance_startup_script" {
  template = file("${path.module}/files/startup-script.sh")
  #template = file(format("%s/files/gceme.sh.tpl", path.module))

  vars = {
    PROXY_PATH = ""
  }
}
module "instance_template" {
  #source              = "../../../modules/instance_template"
  source               = "git::https://github.com/terraform-google-modules/terraform-google-vm.git//modules/instance_template"
  project_id           = var.app_project
  subnetwork           = google_compute_subnetwork.public_subnet.self_link
  service_account      = { "email" = "sp-terraform@caas-sandbox-302320.iam.gserviceaccount.com", "scopes" : ["cloud-platform"] }
  name_prefix          = "hello"
  tags                 = ["http", "https", "ssh"]
  labels               = var.labels     #{ "app" = "apache2" }
  source_image_project = "debian-cloud" # gcloud compute images list | grep debian
  source_image         = "debian-10-buster-v20210122"
  source_image_family  = ""
  machine_type         = var.machine_type #"f1-micro" #"e2-standard-2"
  enable_shielded_vm   = true
  access_config        = []
  metadata             = { ssh-keys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}", enable-oslogin = "TRUE" }
  startup_script       = data.template_file.instance_startup_script.rendered
  #startup_script      = "sudo apt-get update; sudo apt-get install -yq build-essential apache2 && echo '<html><body><h1>Howdy Folks :-)</h1><br><h2>IaC</h2></body></html>' | sudo tee /var/www/html/index.html"
}
