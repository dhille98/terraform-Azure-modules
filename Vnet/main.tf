

resource "azurerm_virtual_network" "Vent-Dec" {
    resource_group_name = var.resource_group_name
    address_space = [var.vnet_address_space]
    location = var.location
    name = "${var.name}-Vnet"
  
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.Vent-Dec.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space, 8, count.index)]
  

}