# Network Security Group
resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_name}-NSG"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# NSG Rules
resource "azurerm_network_security_rule" "nsg_rules" {
  count                       = length(var.nsg_rules)
  name                        = var.nsg_rules[count.index].name
  priority                    = var.nsg_rules[count.index].priority
  direction                   = var.nsg_rules[count.index].direction
  access                      = var.nsg_rules[count.index].access
  protocol                    = var.nsg_rules[count.index].protocol
  source_port_range           = var.nsg_rules[count.index].source_port_range
  destination_port_range      = var.nsg_rules[count.index].destination_port_range
  source_address_prefix       = var.nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_rules[count.index].destination_address_prefix
  network_security_group_name = azurerm_network_security_group.nsg.name
  resource_group_name         = var.resource_group_name
}

# Subnet NSG Association
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association" {
  count                     = length(var.subnet_ids)
  subnet_id                 = var.subnet_ids[count.index]
  network_security_group_id = azurerm_network_security_group.nsg.id
}