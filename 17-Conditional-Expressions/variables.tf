# Input Variables

variable "business_unit" {
  description = "Business Unit Name"
  type = string 
  default = "Finance"
}

variable "environment" {
  description = "Environment Name"
  type = string
  default = "dev" 
}
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
  default = "app1"
}
variable "resource_group_location" {
  description = "Resource Group Location"
  type = string
  default = "Southeast Asia"
}
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string
  default = "app1"
}

variable "vnet_address_space_dev" {
  description = "Virtual Network Address Space for Dev Environment"
  type = list(string)
  default = [ "10.1.0.0/16" ]
}

# 7. Virtual Network Address - 
variable "vnet_address_space_all" {
  description = "Virtual Network Address Space for All Environments except dev"
  type = list(string)
  default = [ "10.2.0.0/16", "10.3.0.0/16", "10.4.0.0/16"]
}
