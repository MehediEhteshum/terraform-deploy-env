resource "azurerm_resource_group" "rg" {
  name     = "rg-env"
  location = var.location
  tags = {
    environment = var.environment
  }
}
