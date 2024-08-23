module "linuxvm" {
  source  = "Azure/compute/azurerm"
  version = "5.3.0"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  vnet_subnet_id = lookup(module.vnet.vnet_subnets_name_id, "subnet3")
  vm_os_simple = "UbuntuServer"
  vm_size     = "Standard_DS1_v2"
  admin_username = var.username
  admin_password = var.password
  public_ip_sku = "Standard"
  enable_ssh_key = false
  allocation_method = "Static"
}