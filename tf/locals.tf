locals {
  vault_username    = sensitive(try(var.vault_username, "${var.name}-${var.environment}"))
  vault_password    = sensitive(try(var.vault_username, "123-${var.name}-${var.environment}"))
  database_username = sensitive(try(var.vault_password, var.name))
  database_password = sensitive(try(var.vault_password, uuid()))
  docker_network    = try(var.docker_network, "vagrant_${var.environment}")
}
