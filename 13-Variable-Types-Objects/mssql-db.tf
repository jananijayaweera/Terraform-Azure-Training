
resource "azurerm_mssql_server" "mssql_svr" {
  name                         = "mssql-server-${random_string.random.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.db_username
  administrator_login_password = var.db_password
}

resource "azurerm_mssql_elasticpool" "mssql_elastic_pool" {
  name                = "mssql-elastic-pool-${random_string.random.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_mssql_server.mssql_svr.name
  license_type        = "LicenseIncluded"
  max_size_gb = "9.7656250"

  sku {
    name     = var.elastic_pool_sku.name
    tier     = var.elastic_pool_sku.tier
    capacity = var.elastic_pool_sku.capacity
  }

  per_database_settings {
    min_capacity = 5
    max_capacity = 5
  }
}





