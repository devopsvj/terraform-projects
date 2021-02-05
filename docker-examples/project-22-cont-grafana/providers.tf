terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.11.0"
    }
  }
}

provider "docker" {
  #version = "~> 2.11.0"
  host    = "npipe:////.//pipe//docker_engine"
}