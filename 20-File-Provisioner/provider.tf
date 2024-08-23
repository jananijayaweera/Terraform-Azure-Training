# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}

# Provider Block
provider "azurerm" {
  features {}
  subscription_id = "43b3f2ee-7c26-4ac9-b907-0fd7ce508380"
}

# Random String Resource
resource "random_string" "random" {
  length  = 6
  upper   = false
  special = false
  numeric = true
}


