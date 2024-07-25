# Input Variables

variable "business_unit" {
  description = "Business Unit Name"
  type        = string
  default     = "hr"
}
variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}
variable "resoure_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg"
}
variable "resoure_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "East US"
}
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "vnet"
}
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
  default     = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}

variable "public_ip_sku" {
  description = "SKU of the Public IP Address"
  type        = map(string)
  default = {
    "southeastasia" = "Standard"
    "eastus"        = "Basic"
  }
}
