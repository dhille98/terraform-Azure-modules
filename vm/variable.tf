variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
}

variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Admin password for the virtual machine"
  sensitive   = true
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to associate with the network interface"
}

variable "disable_password_authentication" {
  type        = bool
  description = "Enable or disable password authentication for the VM"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to assign to the VM and other resources"
  default     = {}
}

variable "image_ref" {
    description = "vm image ref"
    type = object({
      publisher = string
      offer = string
      sku = string
      version = string
    })
  
}