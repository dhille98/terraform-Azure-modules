# VM Module

This module creates an Azure Virtual Machine with the following resources:
- Public IP Address
- Network Interface
- Linux Virtual Machine

## Inputs

| Name                        | Description                                | Type         | Default            |
|-----------------------------|--------------------------------------------|--------------|--------------------|
| `vm_name`                  | Name of the virtual machine                | `string`     | -                  |
| `location`                 | Azure region for resources                 | `string`     | -                  |
| `resource_group`           | Name of the resource group                 | `string`     | -                  |
| `vm_size`                  | Size of the virtual machine                | `string`     | `Standard_B2s`     |
| `admin_username`           | Admin username for the VM                  | `string`     | -                  |
| `admin_password`           | Admin password for the VM                  | `string`     | -                  |
| `subnet_id`                | Subnet ID for the NIC                      | `string`     | -                  |
| `disable_password_authentication` | Disable password authentication for VM | `bool`       | `false`            |
| `tags`                     | Tags to associate with resources           | `map(string)`| `{}`               |

## Outputs

| Name        | Description                       |
|-------------|-----------------------------------|
| `public_ip` | Public IP address of the VM       |
| `vm_id`     | ID of the virtual machine         |
| `nic_id`    | ID of the network interface       |

## Usage

module "vm" {
  source = "./test/vm/"

  vm_name        = "project"
  location       = azurerm_resource_group.RG-Dec.location
  resource_group = azurerm_resource_group.RG-Dec.name
  vm_size        = "Standard_B2s"
  admin_username = "azureuser"
  admin_password = "India@123456"

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