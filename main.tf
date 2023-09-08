terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

module "cloud-env" {
  source      = "./azure-env"
  location    = "East Us"
  environment = var.environment
  local-os    = var.local-os
}