terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

module "cloud-env" {
  source      = var.cloud-provider == "azure" ? "./azure-env" : "./aws-env"
  location    = var.location
  environment = var.environment
  local-os    = var.local-os
}