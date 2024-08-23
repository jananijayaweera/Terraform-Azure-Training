resource "azurerm_virtual_network" "vnet" {
  address_space = var.address_space
  location = var.location
  name = var.vnet_name
  resource_group_name = var.resource_group_name

}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes

}