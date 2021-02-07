terraform {
    required_version = "~> 0.14.0"
    required_providers {
        google =  {
            source = "hashicorp/google"
            version = "~> 3.5.0"
        }
    }
    // backend "local"{
    //     path = "./tfstate/gcp-terraform.tfstate"
    // }
    backend "gcs" {
        bucket = "gcp-dev-tfstate"
        prefix =  "gcp/tfstate/dev/"
        credentials = "~/Documents/Google-GCP-2021/GCP-ServiceAccouts/devopsvj-project/devopsvj-tf-sa/poised-climate-303823-8d82e66fede9.json"
    }  
}