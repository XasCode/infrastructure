terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "xascode"

    workspaces {
      name = "shared_infrastructure"
    }
  }
}