variable "nsg_name" {
  type        = string
  description = "Name of the NSG"
}
variable "location" {
  description = "The location of the Network Security Group"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "nsg_rules" {
  description = "List of NSG rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    
  }))
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the NSG"
  type        = list(string)
}