output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "subnet_association_ids" {
  value = azurerm_subnet_network_security_group_association.subnet_nsg_association[*].id
}

output "nsg_name" {
    value = azurerm_network_security_group.nsg.name
  
}
