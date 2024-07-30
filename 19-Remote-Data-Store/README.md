

## Step-1: Introduction
- Understand about [Terraform Remote State Datasource](https://www.terraform.io/docs/language/state/remote-state-data.html)
- Terraform Remote State Storage Demo with two projects

## Step-2: Create Azure Storage Account for Terraform Remote State Storage
Create Azure Storage Account for Terraform Remote State Storage

Use following bash script to create Azure Storage Account for Terraform Remote State Storage
```bash
  # ./create-sa-backend-datastore.sh <ResourceGroup> <Location> <StorageAccountName> <ContainerName>
  ./create-sa-backend-datastore.sh rg-tf-datastore southeastasia tfdatastore324 tfstate
```

This will create storage account and container with name `tfstate`


## Step-3: Update Backend Configuration in provider.tf

Update the backend configuration in provider.tf file with the storage account details created in step-2

Change the values used in the bash script for storage account name and container name

```t
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
  backend "azurerm" {
    resource_group_name   = "rg-tf-datastore"
    storage_account_name  = "tfdatastore324"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}
```

## Step-4: Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve
```

## Step-5: Delete Azure Backend Storage Account
```bash
# Delete Azure Resource Group
az group delete --name rg-tf-datastore --yes --no-wait
```