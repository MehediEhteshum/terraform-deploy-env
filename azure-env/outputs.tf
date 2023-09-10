output "public-ip-address" {
  value = "${data.azurerm_virtual_machine.vm1-data.name}: ${data.azurerm_virtual_machine.vm1-data.public_ip_address}"
}
