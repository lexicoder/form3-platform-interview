terraform {
  required_version = ">= 1.3.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.25.0"
    }

    vault = {
      version = "3.12.0"
    }
  }
}
