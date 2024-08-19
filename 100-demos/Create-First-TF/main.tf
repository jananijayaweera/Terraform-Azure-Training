terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "demo_rg" {
  name     = "rg-storage-account"
  location = "southeastasia"
}

resource "azurerm_storage_account" "st_demo" {
  name                     = "stkasun4353"
  resource_group_name      = azurerm_resource_group.demo_rg.name
  location                 = azurerm_resource_group.demo_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}

output "st_name" {
  value = azurerm_storage_account.st_demo.name
}

output "primary_access_key" {
  value     = azurerm_storage_account.st_demo.primary_access_key
  sensitive = true

}