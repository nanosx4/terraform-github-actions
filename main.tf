#The configuration for the `remote` backend.
terraform {
  backend "remote" {
    organization = "mateusz"
    workspaces {
      name = "terraform-github-actions"
    }
  }
}
# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}
