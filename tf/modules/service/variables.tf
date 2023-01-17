variable "name" {
  type        = string
  description = "Name of the service."
}

variable "vault_address" {
  type        = string
  description = "URL for vault server."
}

variable "vault_username" {
  type         = string
  sensensitive = true
  description  = "Username for the service's vault configuration."
}

variable "vault_password" {
  type         = string
  sensensitive = true
  description  = "Password for the service's vault configuration."
}

variable "database_username" {
  type        = string
  sensitive   = true
  description = "Database user for the service."
}

variable "database_password" {
  type         = string
  sensensitive = true
  description  = "Database password for the service."
}

variable "docker_image" {
  type        = string
  description = "Docker image for the service."
}

variable "docker_image_tag" {
  type        = string
  default     = "latest"
  description = "Docker image tag for the service."
}

variable "service_ports" {
  type        = list(string)
  default     = []
  description = "List for ports to be opened for the service on the docker host. The format is `<internal_port>:<external_port>`. See `examples.tf` for more details."
}

variable "environment" {
  type        = string
  description = "The environment where the service will be deployed to."
}

variable "docker_network" {
  type        = string
  description = "The docker network the service will use."
}
