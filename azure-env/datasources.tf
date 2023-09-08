## Comment out when a new rg needs to be created, and see & update `module > main`
## Uncomment when an existing rg needs to be used, and replace "your-rg-name"
data "azurerm_resource_group" "rg" {
  name = "your-rg-name"
}

data "azurerm_public_ip" "pubip1-data" {
  name = azurerm_public_ip.pubip1.name
  #   resource_group_name = azurerm_resource_group.rg.name
  resource_group_name = data.azurerm_resource_group.rg.name
}