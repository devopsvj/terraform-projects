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
        credentials = "/<DIR_PATH>/<Service_Account_File_Name>.json"
    }  
}