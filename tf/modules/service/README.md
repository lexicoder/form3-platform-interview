# Service Terraform module

## Features

1. **Deploy service.** Create docker container and related vault configurations for the service.

## Usage

```hcl
module "service" {
  source            = "./modules/service"
  name              = "awesome-service"
  vault_address     = "http://vault:8200"
  vault_username    = "awesome-service-vault-username"
  vault_password    = "awesome-service-vault-password"
  database_username = "awesome-service-database-username"
  database_password = "awesome-service-database-password"
  docker_image      = "awesome-service-docker-image"
  docker_image_tag  = "0.1"
  environment       = "staging"
  docker_network    = "development"
  ports = [
    "80:8080"
  ]
}
```

## Examples

Examples can be found [here](examples/service/main.tf).

## Authors

Module is maintained by [Samuel Isola](https://github.com/lexicoder).
