# Output variable definitions
output "storage_account_id" {
  description = "storage account id"
  value       = azurerm_storage_account.storage_account.id
}
output "storage_account_name" {
  description = "storage account name"
  value       = azurerm_storage_account.storage_account.name
}


