# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "vnet-1"
  #name                = "myvnet-2"  
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name


# # Lifecycle Changes for Prevent Destroy
#   lifecycle {
#     prevent_destroy = true
#   }

}

/*
Sample Error:

╷
│ Error: Instance cannot be destroyed
│ 
│   on network.tf line 2:
│    2: resource "azurerm_virtual_network" "myvnet" {
│ 
│ Resource azurerm_virtual_network.myvnet has lifecycle.prevent_destroy set, but the plan calls for this resource to be destroyed. To avoid this error and continue with the plan, either disable
│ lifecycle.prevent_destroy or reduce the scope of the plan using the -target option.
╵
*/

