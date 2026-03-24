terraform {
  required_version = ">= 1.3.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.9.0"
    }

    vault = {
      version = "3.24.0"
    }
  }
}
