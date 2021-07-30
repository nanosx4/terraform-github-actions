terraform {
  backend "remote" {
    organization = "<your organization name>"
    workspaces {
      name = "<your workspace name>"
    }
  }
  required_version = ">= 0.14.7"
}

provider "aws" {
  region = var.aws_region
}