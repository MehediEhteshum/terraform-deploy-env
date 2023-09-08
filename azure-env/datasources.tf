data "azurerm_resource_group" "rg" {
  name = "learn-fbee058d-9c88-4ec8-a08c-cfbd305d0547"
}

data "azurerm_public_ip" "pubip1-data" {
  name = azurerm_public_ip.pubip1.name
  #   resource_group_name = azurerm_resource_group.rg.name
  resource_group_name = data.azurerm_resource_group.rg.name
}