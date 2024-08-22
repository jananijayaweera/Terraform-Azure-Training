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

variable "app_name" {
  description = "The name of the application."
  type        = string
  default     = "app1"
}

variable "vm_password" {
  description = "The password for the virtual machine."
  type        = string
  default     = "P@ssw0rd1234!"
}

variable "username" {
  description = "The username for the virtual machine."
  type        = string
  default     = "localdmin"
}

variable "managed_disk_type" {
  description = "The type of managed disk to use for the virtual machine."
  type        = string
  default     = "Standard_LRS"
}

variable "os_publisher" {
  description = "The publisher of the operating system image."
  type        = string
  default     = "Canonical"
}

variable "os_offer" {
  description = "The offer of the operating system image."
  type        = string
  default     = "UbuntuServer"
}

variable "os_sku" {
  description = "The SKU of the operating system image."
  type        = string
  default     = "18.04-LTS"
}

variable "os_version" {
  description = "The version of the operating system image."
  type        = string
  default     = "latest"
}

variable "vm_size" {
  description = "The SKU of the virtual machine."
  type        = string
  default     = "Standard_B2s"
}

variable "sa_tier" {
  description = "The tier of the storage account."
  type        = string
  default     = "Standard"
}

variable "sa_replication_type" {
  description = "The replication type of the storage account."
  type        = string
  default     = "LRS"
}