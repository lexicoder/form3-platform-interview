terraform {
  required_version = ">= 1.3.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }

    vault = {
      version = "3.25.0"
    }
  }
}
