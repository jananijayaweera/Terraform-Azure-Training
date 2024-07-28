
## Step-1: Introduction
- Learn [Terraform Conditional Expressions](https://www.terraform.io/docs/language/expressions/conditionals.html) in Terraform
- **Conditional Expression:** A conditional expression uses the value of a bool expression to select one of two values.
```t
# Example-1
condition ? true_val : false_val

# Example-2
var.a != "" ? var.a : "default-a"
```

## Step-2: variables.tf
- In extension to previous section `Terraform Local Values`, we have added Conditional Expressions in local values block. 
- As part of that we have added two more variables in `c2-variables.tf` for this demo
```t

# 6. Virtual Network Address - Dev
variable "vnet_address_space_dev" {
  description = "Virtual Network Address Space for Dev Environment"
  type = list(string)
  default = ["10.0.0.0/16"]
}

# 7. Virtual Network Address - 
variable "vnet_address_space_all" {
  description = "Virtual Network Address Space for All Environment except Dev"
  type = list(string)
  default = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
}

```

## Step-3: local-values.tf
- In extension to previous section `Terraform Local Values`, we have added Conditional Expressions in local values block. 
```t
# Local Values Block

locals {
  rg_name = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"

  service_name = "Demo App"
  owner = "KR"
  common_tags = {
    Service = local.service_name
    Owner = local.owner
  } 

  /* Conditional Expression 
  
  # Example-1
  condition ? true_val : false_val

  # Example-2
  var.a != "" ? var.a : "default-a"  
  */

  vnet_address_space = (var.environment == "dev" ? var.vnet_address_space_dev : var.vnet_address_space_all)

```

## Step-4: networking.tf
- Reference `address_space` argument with local value.
```t
# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  #name                = "myvnet-1"
  name                 = "${var.business_unit}-${var.environment}-${var.virtual_network_name}-vnet"
  address_space       = local.vnet_address_space
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  tags = local.common_tags
}
```

## Step-5: Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Plan: When Variable values, environment = dev 
terraform plan

# Terraform Plan: When Variable values, environment = qa
terraform plan

# Terraform Apply (Optional)
terraform apply -auto-approve
```