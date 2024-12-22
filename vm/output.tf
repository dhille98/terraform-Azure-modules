output "public_ip" {
  value = azurerm_public_ip.testvm_pip1.ip_address
}

output "vm_id" {
  value = azurerm_linux_virtual_machine.vm.id
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}
