# Input variable definitions
## Place holder file

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "sample-rg"

}

variable "location" {
  description = "The Azure Region in which all resources groups should be created."
  type        = string
  default     = "southeastasia"
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
  default     = "43b3f2ee-7c26-4ac9-b907-0fd7ce508380"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "sample-vnet"
}