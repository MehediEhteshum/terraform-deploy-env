terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    aws = {
      source = "hashicorp/aws"
    }
    google = {
      source = "hashicorp/google"
    }
  }
}

module "azure-env" {
  count       = var.cloud-provider == "azure" ? 1 : 0
  source      = "./azure-env"
  location    = var.location-azure
  environment = var.environment
  local-os    = var.local-os
}

module "aws-env" {
  count       = var.cloud-provider == "aws" ? 1 : 0
  source      = "./aws-env"
  location    = var.location-aws
  environment = var.environment
  local-os    = var.local-os
}
