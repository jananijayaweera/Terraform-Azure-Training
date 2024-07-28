
## Step-1: Introduction
- Understand about Datasources in Terraform
- Implement a sample usecase with Datasources.
1. Datasource [azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group)
2. Datasource [azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network)
3. Datasource [azurerm_subscription](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription)


## Step-2: Run Bash Shell Script

This script will create a Resource Group and Storage Account in Azure. So we can use the same Resource Group and Storage Account for our Terraform Datasource examples.

```t
#!/bin/sh

az login

# Variables
export resourceGroupName="tf-class-01-rg"
export location="southeastasia"
export storageAccountName="tfclass01storage324"
export sku="Standard_LRS"

# Create resource group
az group create --name $resourceGroupName --location $location

# Create storage account
az storage account create --name $storageAccountName --resource-group $resourceGroupName --location $location --sku $sku

```

## Step-3: datasources.tf
```t
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
}```

## Step-5: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Create Resources (Optional)
terraform apply -auto-approve
```