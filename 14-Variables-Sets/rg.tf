# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg" {
  for_each = var.environment
  name     = "${var.business_unit}-${each.key}-${var.resource_group_name}"
  location = var.resource_group_location
}