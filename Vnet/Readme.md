### usags

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