 terraform {
   backend "s3" {
     bucket = "tf-backend-2020"
     key    = "remotetf.tfstate"
     region = "us-east-1"
   }
 }
