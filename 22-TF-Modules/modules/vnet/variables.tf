variable "address_space" {
  description = "Address space that is used the virtual network"
  type        = list(string)
  default = [ "10.100.0.0/16", "10.101.0.0/16" ]
}

variable "location" {
  description = "location of the virtual network"
  type        = string
  default     = "southeastasia"
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_prefixes" {
  description = "Address space that is used the subnet"
  type        = list(string)
  default = [ "10.100.1.0/24" ]
}

variable "subscription_id" {
  description = "Subscription ID"
  type        = string
  
}
