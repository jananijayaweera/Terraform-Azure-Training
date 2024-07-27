# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  address_space       = var.virtual_network_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.3.0.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "publicip" {
  name                = "mypublicip-1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku = lookup(var.public_ip_sku, azurerm_resource_group.rg.location, "Standard") # lookup function will check the key and if not found it will return the default value "Standard". we use interpolation to refer the location of the resource group (More preferred way)
  domain_name_label   = "app1-vm-${random_string.random.id}"
  tags = {
    environment = "Dev"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "vmnic" {
  name                = "vmnic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}
