# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_depends_on.location
  resource_group_name = azurerm_resource_group.rg_depends_on.name
}

# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.rg_depends_on.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "publicip" {
  # Add Explicit Dependency to have this resource created only after Virtual Network and Subnet Resources are created. 
  depends_on = [
    azurerm_virtual_network.vnet,
    azurerm_subnet.subnet
  ]
  name                = "publicip-1"
  resource_group_name = azurerm_resource_group.rg_depends_on.name
  location            = azurerm_resource_group.rg_depends_on.location
  allocation_method   = "Static"
  domain_name_label = "test1-vm-${random_string.randomString.result}"
  tags = {
    environment = "Dev"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "vmnic" {
  name                = "vmnic"
  location            = azurerm_resource_group.rg_depends_on.location
  resource_group_name = azurerm_resource_group.rg_depends_on.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.publicip.id 
  }
}
