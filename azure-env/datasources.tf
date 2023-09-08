data "azurerm_public_ip" "pubip1-data" {
  name                = azurerm_public_ip.pubip1.name
  resource_group_name = azurerm_resource_group.rg.name
}