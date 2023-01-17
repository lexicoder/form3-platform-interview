environment = "production"

docker_network = "production"

vault = {
  host_address = "http://localhost:8301"
  token        = "083672fc-4471-4ec4-9b59-a285e463a973"
  address      = "http://vault-production:8200"
}

services = {
  account = {
    docker = {
      image = "form3tech-oss/platformtest-account"
    }
    database = {
      username = "account"
      password = "396e73e7-34d5-4b0a-ae1b-b128aa7f9977"
    }
    vault = {
      username = "account-production"
      password = "123-account-production"
    }
  },
  gateway = {
    docker = {
      image = "form3tech-oss/platformtest-gateway"
    }
    database = {
      username = "gateway"
      password = "33fc0cc8-b0e3-4c06-8cf6-c7dce2705329"
    }
    vault = {
      username = "gateway-production"
      password = "123-gateway-production"
    }
  },
  payment = {
    docker = {
      image = "form3tech-oss/platformtest-payment"
    }
    database = {
      username = "payment"
      password = "821462d7-47fb-402c-a22a-a58867602e39"
    }
    vault = {
      username = "payment-production"
      password = "123-payment-production"
    }
  },
}

frontend = {
  image = "docker.io/nginx"
  tag   = "1.22.0-alpine"
  ports = ["80:4081"]
}
