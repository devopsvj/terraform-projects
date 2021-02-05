terraform {
  backend "remote" {
    organization = "devops-dev"

    workspaces {
      name = "docker-dev"
    }
  }
}