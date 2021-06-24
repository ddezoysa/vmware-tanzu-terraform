terraform {
  backend "local" {
    path = "../workspaces/demo2/terraform.tfstate"
  }
}
