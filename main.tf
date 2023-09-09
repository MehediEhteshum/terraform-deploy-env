terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

module "cloud-env" {
  count       = var.cloud-provider == "azure" ? 1 : 0
  source      = "./azure-env"
  location    = var.location
  environment = var.environment
  local-os    = var.local-os
}
