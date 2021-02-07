# Using Terraform to Auto Scale and Load Balance Compute Engine Instances in GCP
Introduction

## Learning how to configure complex environments with Terraform is a must-have skill. In this hands-on lab, we will provision an autoscaling group with a load balancer.

#### NOTE: Once you have the lab up and running, give it about five minutes for all the software to properly download in order to complete the lab.

### How to Log in to Google Lab Accounts
1. On the lab page, right-click Open Google Console and select the option to open it in a new private browser window (this option will read differently depending on your browser — e.g., in Chrome, it says "Open Link in Incognito Window"). Then, sign in to Google Cloud Platform using the credentials provided on the lab page.

1.  On the Welcome to your new account screen, review the text, and click Accept. In the "Welcome Cloud Student!" pop-up once you're signed in, check to agree to the terms of service, choose your country of residence, and click Agree and Continue.

### Create a Service Account

1. From Google Cloud console's main navigation, choose IAM & Admin > Service Accounts.
1. Click Create service account.
1. Give your service account the name "auto-scaling".
1. Click Create.
1. In the roles dropdown, select Project > Owner.
1. Click Continue and then Done.
1. Copy the new service account's email address and paste it into a text file, as we'll need it later.
1. At the top of the Google Cloud console, copy the project name that appears in the top navigation bar next to Google Cloud Platform. Paste it into the same text file — we'll need it later as well.
1. Log in to the Host Instance and Ensure Terraform Is Installed
1. From Google Cloud navigation, choose Compute Engine > VM instances.

1. Click SSH next to terraform-instance. This will open a terminal session in a new browser tab or window, automatically logging us in to the instance.

1. Use root privileges:
```
sudo -i
```
1. Change into the root directory:
```
cd /
```
1. List its contents:
```
ll
```
1. Make sure you see both a downloads folder and a Terraform zip file.

1. Input the path to communicate with Terraform into the /etc/profile file:
```
echo "PATH='$PATH:/downloads/'" >> /etc/profile
```
1. Run the following in order to be able to call Terraform:
```
source /etc/profile
```
1. Call Terraform:
```
terraform
```
1. Create a Service Account Key within the Instance
1. Allow the SDK to communicate with GCP:
```
gcloud auth login
```
1. Enter Y at the prompt.

1. Click on the link in the output.

1. Select the Cloud Student account.

1. Click Allow.

1. Copy the code provided.

1. Paste the code into the terminal.

1. Create the service account key, replacing <SERVICE_ACCOUNT_EMAIL> with the one you copied earlier in the lab:
```
gcloud iam service-accounts keys create /downloads/auto-scaling.json --iam-account <SERVICE_ACCOUNT_EMAIL>
```
### Create and Deploy the Configuration File
#### Create a main.tf file:

- vim main.tf
1. To avoid adding unnecessary spaces and hashes, type :set paste and then i to enter insert mode.

1. Paste the following configuration, replacing <PROJECT_NAME> with the project name you copied earlier (it appears multiple times in the script, so be sure to replace them all):
```
provider "google" {
  version = "3.5.0"

  credentials = file("/downloads/auto-scaling.json")

  project = "<PROJECT_NAME>"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = "new-terraform-network"
}
resource "google_compute_autoscaler" "foobar" {
  name   = "my-autoscaler"
  project = "<PROJECT_NAME>"
  zone   = "us-central1-c"
  target = google_compute_instance_group_manager.foobar.self_link

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

resource "google_compute_instance_template" "foobar" {
  name           = "my-instance-template"
  machine_type   = "n1-standard-1"
  can_ip_forward = false
  project = "<PROJECT_NAME>"
  tags = ["foo", "bar", "allow-lb-service"]

  disk {
    source_image = data.google_compute_image.centos_7.self_link
  }

  network_interface {
    network = google_compute_network.vpc_network.name
  }

  metadata = {
    foo = "bar"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

resource "google_compute_target_pool" "foobar" {
  name = "my-target-pool"
  project = "<PROJECT_NAME>"
  region = "us-central1"
}

resource "google_compute_instance_group_manager" "foobar" {
  name = "my-igm"
  zone = "us-central1-c"
  project = "<PROJECT_NAME>"
  version {
    instance_template  = google_compute_instance_template.foobar.self_link
    name               = "primary"
  }

  target_pools       = [google_compute_target_pool.foobar.self_link]
  base_instance_name = "terraform"
}

data "google_compute_image" "centos_7" {
  family  = "centos-7"
  project = "centos-cloud"
}

module "lb" {
  source  = "GoogleCloudPlatform/lb/google"
  version = "2.2.0"
  region       = "us-central1"
  name         = "load-balancer"
  service_port = 80
  target_tags  = ["my-target-pool"]
  network      = google_compute_network.vpc_network.name
}
```
1. Save and exit the file by pressing Escape followed by :wq.

1. Initialize the configuration file:
```
terraform init
```
1. Validate the configuration file:
```
terraform validate
```
1. Create the execution plan:
```
terraform plan
```
1. Apply the changes:
```
terraform apply
```
1. Enter yes at the prompt. It will take a few minutes to complete.

1. In the Google Cloud console, refresh the VM instances page. We should now see our two new instances listed.

1. Navigate to VPC network > VPC networks. We should see our new-terraform-network listed.

1. Navigate to Network services > Load balancing. We should see our two new load balancers listed.

####  Conclusion