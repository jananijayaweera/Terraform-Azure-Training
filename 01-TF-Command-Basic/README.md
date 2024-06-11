---
title: Terraform Command Basics
description: Learn Terraform Commands like init, validate, plan, apply and destroy
---

## Step-01: Introduction
- Understand basic Terraform Commands
1. terraform init
2. terraform validate
3. terraform plan
4. terraform apply
5. terraform destroy      

![Image](../Images/terraform-workflow.png)


## Step-02: Review terraform manifests

### Login to Azure CLI

```t
# Azure CLI Login
az login

# List Subscriptions
az account list

# Set Specific Subscription (if we have multiple subscriptions)
az account set --subscription="SUBSCRIPTION_ID"
```

### Teraform Configuration Files

[Create Azure Resource Group](../TF-Command-Basic/terraform-manifests/azure-resource-group.tf)

## Step-03: Terraform Core Commands

```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan to Verify what it is going to create / update / destroy
terraform plan

# Terraform Apply to Create Resources
terraform apply 
```

## Step-04: Verify Azure Resource Group in Azure Management Console

- Go to Azure portal and review the resource 
- Verify newly created Resource Group in Azure Management Console

## Step-05: Destroy Infrastructure

```t
# Destroy Azure Resource Group 
terraform destroy

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

Observation:
1. Verify if the resource group got deleted in Azure Management Console
2. Verify terraform.tfstate file and resource group info should be removed

## Step-08: Conclusion
- Learned about Important Terraform Commands
1. terraform init
2. terraform validate
3. terraform plan
4. terraform apply
5. terraform destroy      
 



