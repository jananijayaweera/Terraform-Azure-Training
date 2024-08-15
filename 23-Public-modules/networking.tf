
# Create Virtual Network and Subnets using Terraform Public Registry Module

# This will use the public module from the Terraform Registry
# https://registry.terraform.io/modules/Azure/vnet/azurerm/latest


module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "4.1.0"
  vnet_name           = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
  vnet_location       = azurerm_resource_group.rg.location
  use_for_each        = var.use_for_each
  subnet_service_endpoints = {
    subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
    subnet3 = ["Microsoft.AzureActiveDirectory"]
  }
  tags = {
    environment = "dev"
    costcenter  = "it"
  }
  depends_on = [azurerm_resource_group.rg]
}

# Create Public IP Address
resource "azurerm_public_ip" "publicip" {
  name                = local.pip_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  domain_name_label   = "app1-${terraform.workspace}-${random_string.random.id}"
  tags                = local.common_tags
}

# Create Network Interface
resource "azurerm_network_interface" "nic" {
  name                = local.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
  tags = local.common_tags
}
