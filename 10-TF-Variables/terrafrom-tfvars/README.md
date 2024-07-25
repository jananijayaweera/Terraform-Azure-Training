## Step-01: Introduction
- Provide Input Variables using `terraform.tfvars` files

## Step-02: Assign Input Variables from terraform.tfvars
- Create a file named `terraform.tfvars` and define variables
- If the file name is `terraform.tfvars`, terraform will auto-load the variables present in this file by overriding the `default` values in `c2-variables.tf`
```t
business_unit = "it"
environment = "stg"
resoure_group_name = "rg-tfvars"
resoure_group_location = "southeastasia"
virtual_network_name = "vnet-tfvars"
subnet_name = "subnet-tfvars"
```

## Step-03: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan
```