terraform {
    required_version = "~> 0.14.0"
    required_providers {
        google =  {
            source = "hashicorp/google"
            version = "~> 3.55.0"
        }
    }
    backend "local"{
        path = "./localtfstate/gcp-terraform.tfstate"
    }
}