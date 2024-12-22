variable "name" {
  description = "The name of the resource group"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location for the resource group"
  type        = string
}


variable "vnet_address_space" {
    description = "vnet cidr block"
    type = string
  
}

variable "subnet_names" {
    description = "subnetes names"
    type = list(string)
  
}