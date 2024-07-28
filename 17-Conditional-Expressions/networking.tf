# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                 = "${var.business_unit}-${var.environment}-${var.virtual_network_name}-vnet"
  address_space       = local.vnet_address_space
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  tags = local.common_tags
}
# Create Public IP Address
resource "azurerm_public_ip" "publicip" {
  name                = "publicip-1"
  resource_group_name = azurerm_resource_group.demo_rg.name
  location            = azurerm_resource_group.demo_rg.location
  allocation_method   = "Static"
  domain_name_label = "app1-vm-${random_string.random.id}"
  tags = local.common_tags
}