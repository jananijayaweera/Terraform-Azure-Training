# Input Variables

# 1. Business Unit Name
variable "business_unit" {
  description = "Business Unit Name"
  type        = string
  default     = "hr"
}
# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type        = set(string)
  default     = ["dev", "qa", "staging", "prod"]
}
# 3. Resource Group Name
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myrg"
}
# 4. Resource Group Location
variable "resource_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "East US"
}

# 5. Virtual Network Name
variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "myvnet"
}

variable "vm_password" {
  description = "Virtual Machine Password"
  type        = string
  sensitive   = true
}