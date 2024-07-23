## Step-01: Input Variables Override default value with cli argument `-var`
- We are going to override the default values defined in `variables.tf` by providing new values using the `-var` argument using CLI
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Option-1 (Always provide -var for both plan and apply)
# Review the terraform plan
terraform plan -var="resource_group_name=demo_rg" -var="resource_group_location=southeastasia" -var="virtual_network_name=demovnet" 

```
