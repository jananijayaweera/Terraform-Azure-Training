resource "azurerm_public_ip" "pip" {
  name                    = "${local.resource_prefix}-pip"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  domain_name_label       = "${var.app_name}-${random_string.random.result}-pip"
  tags = {
    environment = var.environment
  }

}