variable "business_unit" {
  description = "Business Unit Name"
  type        = string
  default     = "it"
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
  default     = "southeastasia"
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
variable "public_ip_name" {
  description = "Public IP Name"
  type        = string
}
variable "network_interface_name" {
  description = "Network Interface Name"
  type        = string
}

variable "use_for_each" {
  type    = bool
  default = true
}

variable "username" {
  description = "Username for the VM"
  type        = string
  default = "localadmin"
}

variable "password" {
  description = "Password for the VM"
  type        = string
  default = "Password1234!"
}





