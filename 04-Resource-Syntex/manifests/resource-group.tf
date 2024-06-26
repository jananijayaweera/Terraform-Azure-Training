# Resource Block
# Create a resource group
resource "azurerm_resource_group" "demo-rg" {
  name = "first-tf-rg"
  location = "Southeast Asia"
}