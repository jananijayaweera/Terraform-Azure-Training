data "azurerm_resource_group" "storage_rg" {
  name = "tf-class-01-rg"
}

data "azurerm_storage_account" "storage_account" {
  name = "tfclass01storage324"
  resource_group_name = data.azurerm_resource_group.storage_rg.name
}

output "storage_account_connection_string" {
  value = data.azurerm_storage_account.storage_account.primary_connection_string
  sensitive = true
}

output "storage_account_id" {
  value = data.azurerm_storage_account.storage_account.id
}

output "storage_account_location" {
  value = data.azurerm_storage_account.storage_account.location
}

output "storage_account_name" {
  value = data.azurerm_storage_account.storage_account.name
}