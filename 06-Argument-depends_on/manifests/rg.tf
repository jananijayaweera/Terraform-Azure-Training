# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg_depends_on" {
  name = "rg-tf-depends-on-demo"
  location = "southeastasia"
}