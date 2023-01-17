variable "environment" {}
variable "docker_network" {}

variable "vault" {
  type = object({
    host_address = string
    token        = string
    address      = string
  })
}

variable "services" {
  type = map(object({
    image = string
    tag   = optional(string, "latest")
    ports = optional(list(string), [])
    database = optional(object({
      user     = string
      password = string
    }))
    vault = optional(object({
      username = string
      password = string
    }))
  }))
}

variable "frontend" {
  type = object({
    image = string
    tag   = optional(string, "latest")
    ports = optional(list(string), [])
  })
}
