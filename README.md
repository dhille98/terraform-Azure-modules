# terraform-Azure-modules

### usags of vnet

module "vnet" {
    source = ./
    name = "string"
    resource_group_name = string 
    location = string
    address_space = "0.0.0.0/0"
    subnet_names         = ["subnet-1", "subnet-2", "subnet-3"]

}

output "vnet_name" {
  value = module.vnet.vnet_name

}
output "subnet_ids" {
  value = module.vnet.subnet_ids
}

# uses of nsg
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

## Usage of vm

module "vm" {
  source = "./test/vm/"

  vm_name        = "project"
  location       = azurerm_resource_group.RG-Dec.location
  resource_group = azurerm_resource_group.RG-Dec.name
  vm_size        = "Standard_B2s"
  admin_username = "*****"
  admin_password = "*******"

  subnet_id = module.vnet.subnet_ids[0]

  disable_password_authentication = false

  image_ref = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    Environment = "Dev"
    version = "V1.0"
  }
}


## call modules 
output "public_ip" {
    value = module.vm.public_ip
}