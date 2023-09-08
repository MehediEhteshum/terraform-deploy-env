resource "azurerm_resource_group" "rg" {
  name     = "rg-env"
  location = var.location
  tags = {
    environment = var.environment
  }
}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1-rg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.123.0.0/16"]

  tags = {
    environment = var.environment
  }
}

resource "azurerm_subnet" "snet1" {
  name                 = "snet1-vnet1-rg"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.123.1.0/24"]
}

resource "azurerm_network_security_group" "nsg1" {
  name                = "nsg1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  tags = {
    environment = var.environment
  }
}

resource "azurerm_network_security_rule" "nsrule1" {
  name                        = "nsrule1-nsg1"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg.name
  network_security_group_name = azurerm_network_security_group.nsg1.name
}

resource "azurerm_subnet_network_security_group_association" "snet1-nsg1" {
  subnet_id                 = azurerm_subnet.snet1.id
  network_security_group_id = azurerm_network_security_group.mtc-sg.id
}
