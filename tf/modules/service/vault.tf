resource "vault_generic_secret" "this" {
  path = "secret/${var.environment}/${var.name}"

  data_json = <<EOT
{
  "db_user":   "${var.database_username}",
  "db_password": "${var.database_password}"
}
EOT
}

resource "vault_policy" "this" {
  name = "${var.name}-${var.environment}"

  policy = <<EOT

path "secret/data/${var.environment}/${var.name}" {
    capabilities = ["list", "read"]
}

EOT
}

resource "vault_generic_endpoint" "this" {
  path                 = "auth/userpass/users/${var.name}-${var.environment}"
  ignore_absent_fields = true

  data_json = <<EOT
{
  "policies": ["${var.vault_username}"],
  "password": "${var.vault_password}"
}
EOT
}
