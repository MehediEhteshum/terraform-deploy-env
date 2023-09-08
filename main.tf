terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

module "cloud-env" {
  source   = "./azure-env"
  location = "East Us"
}