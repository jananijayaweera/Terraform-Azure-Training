# Input Variables
variable "business_unit" {
  description = "Business Unit Name"
  type = string
  default = "hr"
}
variable "environment" {
  description = "Environment Name"
  type = string
  default = "dev"
}
variable "resoure_group_name" {
  description = "Resource Group Name"
  type = string
  default = "myrg"
}
variable "resoure_group_location" {
  description = "Resource Group Location"
  type = string
  default = "eastus"
}
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string 
  default = "myvnet"
}
variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type = string 
}
variable "publicip_name" {
  description = "Public IP Name"
  type = string 
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type = string
  
}

variable "client_id" {
  description = "Azure Client ID"
  type = string
  
}

variable "client_secret" {
  description = "Azure Client Secret"
  type = string
  
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type = string
  
}








