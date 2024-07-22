# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
}

# Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = "subnet-1"
  resource_group_name  = azurerm_resource_group.demo_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Azure Public IP Address
resource "azurerm_public_ip" "publicip" {
  count = 2
  name                = "publicip-${count.index}"
  resource_group_name = azurerm_resource_group.demo_rg.name
  location            = azurerm_resource_group.demo_rg.location
  allocation_method   = "Static"
  domain_name_label = "test1-vm-${count.index}-${random_string.random.id}"  
}

# Create Network Interface
resource "azurerm_network_interface" "vmnic" {
  count =2 
  name                = "vmnic-${count.index}"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = element(azurerm_public_ip.publicip[*].id, count.index)     
  }
}
