# Azure DevOps  CI/CD

## Prerequisites

1. Azure Subscription
2. Azure DevOps Account (https://dev.azure.com/)


## Authenticate Azure DevOps with Azure

- Go to Azure DevOps
- Click on "Project Settings"
- Click on "Service connections"
- Click on "New service connection"
- Select "Azure Resource Manager"
- Click on "Next"
- Select "Service principal (automatic)"
- Click on "Next"
- Select the Azure Subscription
- Click on "Verify and save"

More details can be found [here](https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml)

## Setup Azure Backend

### Create a Storage Account

```bash
#!/bin/bash

# Usage: ./create-sa-backend-datastore.sh <ResourceGroup> <Location> <StorageAccountName> <ContainerName>
# Example: ./create-sa-backend-datastore.sh rg-tf-datastore southeastasia tfdatastore324 tfstate

ResourceGroup=$1
Location=$2
StorageAccountName=$3
ContainerName=$4

# Login to Azure

az login

# Create a resource group
if [ $(az group exists --name $ResourceGroup) == false ]; then
    echo "Creating resource group $ResourceGroup in $Location"
    az group create --name $ResourceGroup --location $Location
else
    echo "Resource group $ResourceGroup already exists"
fi

# Create a storage account

if [ $(az storage account check-name --name $StorageAccountName --query nameAvailable) == true ]; then
    echo "Creating storage account $StorageAccountName in $Location"
    az storage account create --name $StorageAccountName --resource-group $ResourceGroup --location $Location --sku Standard_LRS
else
    echo "Storage account $StorageAccountName already exists"
fi

# Create a storage container

az storage container create --name $ContainerName --account-name $StorageAccountName
```

### Azure DevOps Pipeline

Following is the Azure DevOps pipeline to validate, plan and apply the Terraform configuration.

```yaml
trigger:
  - main

pool:
  vmImage: "ubuntu-latest"

stages:
  - stage: "validateTerraform"
    displayName: "Terraform - Validate"
    jobs:
      - job: "TerraformJobs"
        displayName: "Terraform > install, init and validate"
        continueOnError: false
        steps:
          - task: TerraformInstaller@0
            displayName: Install Terraform
            inputs:
              terraformVersion: 'latest'
        
          - task: TerraformTaskV4@4
            displayName: Terraform Init
            inputs:
              provider: 'azurerm'
              command: 'init'
              backendAzureRmUseEntraIdForAuthentication: false
              backendServiceArm: 'Azure-Spon'
              backendAzureRmResourceGroupName: 'rg-tfstate'
              backendAzureRmStorageAccountName: 'statetfstoragedemo'
              backendAzureRmContainerName: 'tfstate'
              backendAzureRmKey: 'terraform.tfstate'

          - task: TerraformTaskV4@4
            displayName: Teraform Validate
            inputs:
              provider: 'azurerm'
              command: 'validate'


  - stage: "planTerraform"
    displayName: "Terraform - Plan"
    dependsOn:
      - "validateTerraform"
    jobs:
      - job: "TerraformJobs"
        displayName: "Terraform > install, init & plan"
        steps:
        
          - task: TerraformInstaller@1
            displayName: Install Terraform
            inputs:
              terraformVersion: 'latest'
            
          - task: TerraformTaskV4@4
            displayName: Terraform Init
            inputs:
              provider: 'azurerm'
              command: 'init'
              backendAzureRmUseEntraIdForAuthentication: false
              backendServiceArm: 'Azure-Spon'
              backendAzureRmResourceGroupName: 'rg-tfstate'
              backendAzureRmStorageAccountName: 'statetfstoragedemo'
              backendAzureRmContainerName: 'tfstate'
              backendAzureRmKey: 'terraform.tfstate'

          - task: TerraformTaskV4@4
            displayName: Terraform Plan
            inputs:
              provider: 'azurerm'
              command: 'plan'
              environmentServiceNameAzureRM: 'Azure-Spon'


          - task: TerraformTaskV4@4
            displayName: Terraform Apply
            inputs:
              provider: 'azurerm'
              command: 'apply'
              commandOptions: '-auto-approve'
              environmentServiceNameAzureRM: 'Azure-Spon'
```