output "public_ip_address" {
  value = "${azurerm_linux_virtual_machine.vm1.name}: ${data.azurerm_public_ip.pubip1-data.ip_address}"
}