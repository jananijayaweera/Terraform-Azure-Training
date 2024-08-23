
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

module "azure_static_website" {
  source   = "./modules/azure-static-website"
  location = azurerm_resource_group.resource_group.location
  subscription_id = var.subscription_id
  resource_group_name = azurerm_resource_group.resource_group.name

  # Storage Account
  storage_account_name              = "staticwebsite"
  storage_account_tier              = "Standard"
  storage_account_replication_type  = "LRS"
  storage_account_kind              = "StorageV2"
  static_website_index_document     = "index.html"
  static_website_error_404_document = "error.html"
}

module "vnet" {
  source = "./modules/vnet"
  location = azurerm_resource_group.resource_group.location
  subscription_id = var.subscription_id
  resource_group_name = azurerm_resource_group.resource_group.name
  vnet_name = var.vnet_name
}

module "compute01" {
  source = "./modules/compute"
  location = azurerm_resource_group.resource_group.location
  subscription_id = var.subscription_id
  resource_group_name = azurerm_resource_group.resource_group.name
  subnet_id = module.vnet.subnet_id 
  vm_name = "vm-01"
}

module "compute02" {
  source = "./modules/compute"
  location = azurerm_resource_group.resource_group.location
  subscription_id = var.subscription_id
  resource_group_name = azurerm_resource_group.resource_group.name
  subnet_id = module.vnet.subnet_id 
  vm_name = "vm-02"
}