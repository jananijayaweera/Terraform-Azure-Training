# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name = local.rg_name
  location = var.resource_group_location
  tags = local.common_tags
}