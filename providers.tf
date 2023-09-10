# Azure provider
provider "azurerm" {
  features {}
}

# AWS provider
provider "aws" {
  region                  = var.location-aws
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "vscode"
}
