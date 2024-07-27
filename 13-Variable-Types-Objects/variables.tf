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
  default     = "myrg"
}
variable "resoure_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "eastus"
}
variable "common_tags" {
  description = "Common Tags for Azure Resources"
  type        = map(string)
  default = {
    "CLITool" = "Terraform"
    "Tag1"    = "Azure"
  }
}

variable "db_name" {
  description = "Azure MySQL Database DB Name"
  type        = string
}

variable "db_username" {
  description = "Azure MySQL Database Administrator Username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Azure MySQL Database Administrator Password"
  type        = string
  sensitive   = true
}

variable "sku" {
  description = "Azure MySQL Database SKU"
  type        = string
  default     = "Standard"
}

# Variable Type: object
variable "elastic_pool_sku" {
  description = "values for maintenance policy"
  type = object({
    name     = string,
    tier     = string,
    capacity = number
  })
}
