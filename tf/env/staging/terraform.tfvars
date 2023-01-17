environment = "staging"

docker_network = "platform-interview_staging"

vault = {
  host_address = "http://localhost:8401"
  token        = "18e29d43-7d4c-492f-b32f-fea3774b7978"
  address      = "http://vault-staging:8200"
}

services = {
  account = {
    name  = "account"
    image = "form3tech-oss/platformtest-account"
    database = {
      user     = "account"
      password = "52b970fe-27af-41b2-937a-7dc9fd84e95b"
    }
    vault = {
      username = "account-staging"
      password = "123-account-staging"
    }
  },
  gateway = {
    name  = "gateway"
    image = "form3tech-oss/platformtest-gateway"
    database = {
      user     = "gateway"
      password = "de658304-bda5-45a2-809c-71b496f9e9c2"
    }
    vault = {
      username = "gateway-staging"
      password = "123-gateway-staging"
    }
  },
  payment = {
    name  = "payment"
    image = "form3tech-oss/platformtest-payment"
    database = {
      user     = "payment"
      password = "3b65a3ea-4048-49cc-9156-7acce61ce253"
    }
    vault = {
      username = "payment-staging"
      password = "123-payment-staging"
    }
  },
}

frontend = {
  image = "docker.io/nginx"
  tag   = "1.22.0-alpine"
  ports = ["80:4082"]
}
