# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-1"
  #name                = "myvnet-2"
  address_space       = ["10.1.0.0/16"]
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name


# Lifecycle Changes
  lifecycle {
    create_before_destroy = true
  }

}


/*
The create_before_destroy meta-argument changes this behavior so that the new replacement object is created first, and the prior object is destroyed after the replacement is created.
*/

