variable "environment" {
  type = string
}

variable "docker_network" {
  type = string
}

variable "vault" {
  type = object({
    host_address = string
    token        = string
    address      = string
  })
}

variable "services" {
  type = map(object({
    docker = object({
      image = string
      tag   = optional(string, "latest")
    })
    ports = optional(list(string), [])
    database = object({
      username = string
      password = string
    })
    vault = object({
      username = string
      password = string
    })
  }))
}

variable "frontend" {
  type = object({
    image = string
    tag   = optional(string, "latest")
    ports = optional(list(string), [])
  })
}
