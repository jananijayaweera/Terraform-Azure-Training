# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name = "rg-tf-lifecycle-prevent-destroy"
  location = "Southeast Asia"
}