
## Step-1: Introduction
- Provide Input Variables using `<name>.tfvars` file with CLI 
argument `-var-file`

## Step-2: Assign Input Variables with -var-file argument
- If we plan to use different names for  `.tfvars` files, then we need to explicitly provide the argument `-var-file` during the `terraform plan or apply`
- We will use following things in this example
- **terraform.tfvars:** All other common variables will be picked from this file and environment specific files will be picked from specific `env.tfvars` files
- **dev.tfvars:** `environment` and `resoure_group_location` variable will be picked from this file
- **qa.tfvars:** `environment` and `resoure_group_location` variable will be picked from this file
### terraform.tfvars
```t
business_unit = "it"
resource_group_name = "rg-tfvars-demo"
resource_group_location = "southeastasia"
virtual_network_name = "vnet-tfvars"
subnet_name = "subnet-tfvars"
```
### dev.tfvars
```t
environment = "dev"
resoure_group_location = "southeastasia"
```
### qa.tfvars
```t
environment = "qa"
resoure_group_location = "westeurope"
```

## Step-3: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan -var-file="env/dev.tfvars" -out=tfplandev
terraform plan -var-file="env/qa.tfvars" -out=tfplanqa

# Terraform Apply - Dev Environment
terraform apply -var-file="env/dev.tfvars" 

# Terraform Apply - QA Environment
terraform apply -var-file="env/qa.tfvars" # Do it on a separate directory because it will overwrite the existing tfstate file and create new resources in the same resource group
```