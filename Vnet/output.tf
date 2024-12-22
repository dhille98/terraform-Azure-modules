

output "vnet_name" {
  value = azurerm_virtual_network.Vent-Dec.name
}
output "subnet_ids" {
  value = azurerm_subnet.subnet[*].id
}

