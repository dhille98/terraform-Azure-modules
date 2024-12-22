# uses 
module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = "project-nsg"
  location            = "West US"
  resource_group_name = azurerm_resource_group.RG-Dec.name
  nsg_rules = [
    {
      name                        = "Allow-SSH"
      priority                    = 100
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "22"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    },
    {
      name                        = "Allow-HTTP"
      priority                    = 200
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "80"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
    }
  ]
  subnet_ids = [
    azurerm_subnet.subnet[0].id,
    azurerm_subnet.subnet[1].id
  ]
}


output "nsg_id" {
  value = module.nsg.nsg_id.id
}
output "nsg_name" {
  value = module.nsg.nsg_name.name
}
