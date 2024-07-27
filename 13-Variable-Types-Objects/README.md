## Step-1: Introduction
- Learn about [Terraform Variables Structural Types](https://www.terraform.io/docs/language/expressions/type-constraints.html#structural-types)
- Structural types in Terraform allow multiple values of different types to be grouped together as a single value. 
- Using structural types requires a data schema to be defined for the Input Variables type so that Terraform knows what a valid value is.
- Implement Input Variable Structural Type `object`
- **object():** A collection of values each with their own type.

## Step-2: variables.tf
- We are going to enable SQL server with elastic pool in Azure MySQL flexible server.
- For that `maintenance_window` block we are going to implement the `Input Variable Structural Type object()`
- Review documentation [azurerm_mssql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server)
```t
# Variable Type: object
variable "elastic_pool_sku" {
  description = "values for maintenance policy"
  type = object({
    name     = string,
    tier     = string,
    capacity = number
  })
}
```

## Step-3: Update terraform.tfvars
```t
# DB Variables
db_name = "db101"

# Variables type of object
elastic_pool_sku = {
  name     = "BasicPool"
  tier     = "Basic"
  capacity = 100
}
```

## Step-4: Execute Terraform Command
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan -var-file="secrets.tfvars"

# Terraform Apply (Optional)
terraform apply -var-file="secrets.tfvars"
```