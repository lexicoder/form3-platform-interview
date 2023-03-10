# form3-platform-interview

## Design Decisions

* **Service Module**: A [module](tf/modules/service/README.md) was created to handle the creation of all the resources a service needs. This reduces duplication of code in the terraform config.
* **One tfvars file per environment**
* **Workspaces**: Separate workspaces created per environment during `vargrant up` run.

## CI/CD

The following can be added to a CI/CD configuration .

* Pipleine step to run `terraform init`.
* Pipleine step to run `terraform plan -var-file=env/<environment>/terraform.tfvars -out=tfplan`.
* Pipleine step to run `terraform apply -auto-approve tfplan`.

*A sample CI/CD config can be found in [here](.github/workflows/ci.yaml).*
