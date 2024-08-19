# Input Variables

variable "business_unit" {
  description = "Business Unit Name"
  type = string 
  default = "Finance"
}

# This will be prompted when you run terraform plan or terraform apply
variable "environment" {
  description = "Environment Name"
  type = string
}
variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
  default = "rg-tf-vars-basic"
}

# This will be prompted when you run terraform plan or terraform apply
variable "resource_group_location" {
  description = "Resource Group Location"
  type = string
}
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type = string
  default = "app1"
}


/*

Example:

terraform apply -auto-approve 
var.environment
  Environment Name

  Enter a value: Dev

var.resource_group_location
  Resource Group Location

  Enter a value: southeastasia

*/