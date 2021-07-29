#The configuration for the `remote` backend.
terraform {
  backend "remote" {
    organization = "mateusz"
    workspaces {
      name = "terraform-github-actions"
    }
  }
}

provider "aws" {
    region = "eu-west-1"
}

resource "aws_api_gateway_rest_api" "LicytomatAPI" {
  name        = "LicytomatAPI"
  description = "API for Licytomat project"
}
