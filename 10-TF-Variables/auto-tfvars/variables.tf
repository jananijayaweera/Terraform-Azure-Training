# Input Variables

variable "business_unit" {
  description = "Business Unit Name"
  type        = string
  default     = "Finance"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev"
}
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-tf-vars-basic"
}
variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "Southeast Asia"
}
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "app1"
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

