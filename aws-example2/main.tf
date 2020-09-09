terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  version = "~> 3.0"
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "tf-example" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
      Name = "my-tf-ec2-1"
      Owner = "devopstf"
      Dept = "TF Learning"
  }
}
