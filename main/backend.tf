terraform {
  backend "local" {
    path = "../workspaces/dev/terraform.tfstate"
  }
}
