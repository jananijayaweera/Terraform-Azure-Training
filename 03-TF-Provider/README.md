---
title: Terraform Settings, Providers and Resource Blocks 
description: Learn Key blocks of Terraform like Settings, Providers and Resource Blocks
---


### Step- 1: Understand about Terraform Settings Block
- [Terraform Settings Block](https://www.terraform.io/docs/language/settings/index.html)
- Required Terraform Version
- Provider Requirements
- Terraform backends
- Experimental Language Features
- Passing Metadata to Providers

## Step-3: Create a simple terraform block and play with required_version
- `required_version` focuses on underlying Terraform CLI installed on your desktop
- If the running version of Terraform on your local desktop doesn't match the constraints specified in your terraform block, Terraform will produce an error and exit without taking any further actions.
- By changing the versions try `terraform init` and observe whats happening


## Step-4: Terraform Providers
- Learn about [Terraform Providers](https://www.terraform.io/docs/language/providers/configuration.html)

## Step-5: Provider Requirements
- Define required providers in Terraform Block
- Understand about three things about defining `required_providers` in terraform block
  - local names
  - source
  - version


## Step-6: Provider Block for Azure  
- Understand about [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
```t
# Provider Block
provider "azurerm" {
features {}
}
```
- Discuss about [Authentication Types](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#authenticating-to-azure) 
- Authenticating to Azure using the Azure CLI
- Authenticating to Azure using Managed Service Identity
- Authenticating to Azure using a Service Principal and a Client Certificate
- Authenticating to Azure using a Service Principal and a Client Secret  
- Finally, understand about [Features Block](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#features) in Provider Block 
```t
# Initialize Terraform
terraform init

# Validate Terraform Configuration files
terraform validate

# Execute Terraform Plan
terraform plan
```  

## Step-7: Create a simple Resource Block - c2-resource-group.tf
```t
# Resource Block
# Create a resource group
resource "azurerm_resource_group" "demo-rg" {
  name = "first-tf-rg"
  location = "Southeast Asia"
}
```

## Step-8: Clean-Up 
```t
# Destroy Terraform Resources
terraform destroy -auto-approve

# Delete Terraform Files
rm -rf .terraform*
rm -rf terraform.tfstate*
```


## References
- [Terraform Providers](https://www.terraform.io/docs/configuration/providers.html)
- [Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure Resource Group Terraform Resource](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
- [Terraform Version Constraints](https://www.terraform.io/docs/configuration/version-constraints.html)
- [Terraform Versions - Best Practices](https://www.terraform.io/docs/configuration/version-constraints.html#best-practices)