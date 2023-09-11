# Azure provider
provider "azurerm" {
  features {}
}

# AWS provider
# Create the credentials file using AWS toolkit extension and AWS user profile & secrets csv
provider "aws" {
  region                   = var.location-aws
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "vscode"
}

# GCP provider
# Create a service account and download secrets json to use as credentials file
provider "google" {
  credentials = file(var.keyfilepath-gcp)
  project     = var.projectid-gcp
  region      = var.location-gcp
}

# GCP beta provider
provider "google-beta" {
  credentials = file(var.keyfilepath-gcp)
  project     = var.projectid-gcp
  region      = var.location-gcp
}
