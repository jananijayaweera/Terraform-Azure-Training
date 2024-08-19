# Variables for the Create-Windows-VM module

variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
  default     = "rg-vm-proj-01"
}

variable "location" {
  description = "The location in which the resources will be created."
  type        = string
  default     = "East US"
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "vm-vnet-dev-vnet"

}

variable "environment" {
  description = "The environment in which the resources will be created."
  type        = string
  default     = "dev"

}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "vm-vnet-dev-subnet"

}