resource "docker_container" "this" {
  name  = "${var.name}_${var.environment}"
  image = "${var.docker_image}:${var.docker_image_tag}"

  env = [
    "VAULT_ADDR=${var.vault_address}",
    "VAULT_USERNAME=${var.vault_username}",
    "VAULT_PASSWORD=${var.vault_password}",
    "ENVIRONMENT=${var.environment}"
  ]

  dynamic "ports" {
    for_each = var.service_ports
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
