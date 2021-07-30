terraform {
  backend "remote" {
    organization = "mateusz"
    workspaces {
      name = "terraform-github-actions"
    }
  }
  required_version = ">= 0.14.7"
}

provider "aws" {
  region = var.aws_region
}