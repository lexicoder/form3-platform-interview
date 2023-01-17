environment = "development"

docker_network = "development"

vault = {
  host_address = "http://localhost:8201"
  token        = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
  address      = "http://vault-development:8200"
}

services = {
  account = {
    docker = {
      image = "form3tech-oss/platformtest-account"
    }
    database = {
      username = "account"
      password = "965d3c27-9e20-4d41-91c9-61e6631870e7"
    }
    vault = {
      username = "account-development"
      password = "123-account-development"
    }
  },
  gateway = {
    docker = {
      image = "form3tech-oss/platformtest-gateway"
    }
    database = {
      username = "gateway"
      password = "10350819-4802-47ac-9476-6fa781e35cfd"
    }
    vault = {
      username = "gateway-development"
      password = "123-gateway-development"
    }
  },
  payment = {
    docker = {
      image = "form3tech-oss/platformtest-payment"
    }
    database = {
      username = "payment"
      password = "a63e8938-6d49-49ea-905d-e03a683059e7"
    }
    vault = {
      username = "payment-development"
      password = "123-payment-development"
    }
  },
}

frontend = {
  image = "docker.io/nginx"
  tag   = "latest"
  ports = ["80:4080"]
}
