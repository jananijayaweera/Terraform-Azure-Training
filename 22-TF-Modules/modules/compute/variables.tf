variable "vm_name" {
  description = "name of the virtual machine"
  type        = string
  default = "vm"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "location of the virtual machine"
  type        = string
  default     = "southeastasia"
}

variable "vm_size" {
  description = "size of the virtual machine"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
  default     = "azureuser"
  
}

variable "admin_password" {
  description = "Password for the virtual machine"
  type        = string
  default = "Password1234!"
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "subscription_id" {
  description = "value of the subscription id"
}