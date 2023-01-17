resource "vault_audit" "audit" {
  type = "file"

  options = {
    file_path = "/vault/logs/audit"
  }
}

resource "vault_auth_backend" "userpass" {
  type = "userpass"
}

module "service" {
  for_each          = var.services
  source            = "./modules/service"
  name              = each.key
  vault_address     = var.vault.address
  vault_username    = each.value.vault.username
  vault_password    = each.value.vault.password
  database_username = each.value.database.username
  database_password = each.value.database.password
  docker_image      = each.value.docker.image
  docker_image_tag  = each.value.docker.tag
  environment       = var.environment
  docker_network    = var.docker_network
  depends_on = [
    vault_auth_backend.userpass
  ]
}

resource "docker_container" "frontend" {
  image = "${var.frontend.image}:${var.frontend.tag}"
  name  = "frontend_${var.environment}"

  dynamic "ports" {
    for_each = var.frontend.ports
    content {
      internal = split(":", ports.value)[0]
      external = split(":", ports.value)[1]
    }
  }

  networks_advanced {
    name = var.docker_network
  }

  lifecycle {
    ignore_changes = all
  }
}
