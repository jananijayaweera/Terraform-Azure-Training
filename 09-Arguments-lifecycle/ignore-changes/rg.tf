# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name = "rg-tf-lifecycle-ignore-changes"
  location = "Southeast Asia"
}