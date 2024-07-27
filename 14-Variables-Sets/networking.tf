# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  for_each            = var.environment
  name                = "${var.business_unit}-${each.key}-${var.virtual_network_name}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name
}

# Create Subnet
resource "azurerm_subnet" "subnet" {
  for_each             = var.environment
  name                 = "${var.business_unit}-${each.key}-${var.virtual_network_name}-mysubnet"
  resource_group_name  = azurerm_resource_group.rg[each.key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "publicip" {
  for_each            = var.environment
  name                = "${var.business_unit}-${each.key}-publicip"
  resource_group_name = azurerm_resource_group.rg[each.key].name
  location            = azurerm_resource_group.rg[each.key].location
  allocation_method   = "Static"
  domain_name_label   = "app1-vm-${each.key}-${random_string.random[each.key].id}"
  tags = {
    environment = each.key
  }
}

# Create Network Interface
resource "azurerm_network_interface" "vmnic" {
  for_each            = var.environment
  name                = "${var.business_unit}-${each.key}-${var.virtual_network_name}-vmnic"
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip[each.key].id
  }
}
