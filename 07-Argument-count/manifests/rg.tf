# Azure Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name = "rg-tf-count-arg-demo"
  location = "Southeast Asia"
}