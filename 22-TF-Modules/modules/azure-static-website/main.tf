# Provider Block
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Random String Resource
resource "random_string" "random" {
  length  = 6
  upper   = false
  special = false
  numeric = true
}

resource "azurerm_storage_account" "storage_account" {
  name                = "${var.storage_account_name}${random_string.random.id}"
  resource_group_name = var.resource_group_name

  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.storage_account_kind

  static_website {
    index_document     = var.static_website_index_document
    error_404_document = var.static_website_error_404_document
  }
}

