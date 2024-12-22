# Public IP Address
resource "azurerm_public_ip" "testvm_pip1" {
  name                = "${var.vm_name}-pip1"
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = "Standard"
  allocation_method   = "Static"
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.testvm_pip1.id
  }
}

# Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.vm_name}-vm"
  location            = var.location
  resource_group_name = var.resource_group
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference {
    publisher = var.image_ref.publisher
    offer     = var.image_ref.offer
    sku       = var.image_ref.sku
    version   = var.image_ref.version
  }

  disable_password_authentication = var.disable_password_authentication

  tags = var.tags
}
