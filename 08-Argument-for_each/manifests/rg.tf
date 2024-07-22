# For_each is used to create multiple instances of a resource with a single block of configuration.
resource "azurerm_resource_group" "demo_rg" {
  for_each = {
    resource = "eastus"
    resource2= "eastus2"
    resource3 = "westus"
  }
  name = "rg-${each.key}"
  location = each.value 
}