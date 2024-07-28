
### What is DRY Principle ?
Don't repeat yourself

A module's local block defines one or more local variables. 
A local value gives a name to a Terraform expression, allowing it to be used numerous times within a module without being repeated.

### When Should We Use Local Values?
Local values can help you avoid duplicating the same values or phrases numerous times in a configuration.
If misused, they can also make a configuration difficult to interpret for future maintainers by concealing the actual values utilised.
Use local values in moderation, when a single value or result is used in multiple places and is expected to change in the future. The capacity to readily update the value in a central location is the primary benefit of local values.

### What is the problem that locals are trying to solve?
Terraform currently does not support variable substitution within variables. Terraform accomplishes this by using local values or locals, which allow you to keep your code DRY.

Another use case (at least for me) for locals is shortening references to upstream Terraform projects, as shown below. This will make your Terraform templates and modules more readable.

We can define as many local blocks as needed in that Module.  The names assigned to the elements in the local block must be unique across the module.



## Step-1: local-values.tf
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
}  
```

## Step-2: rg.tf
```t
# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "demo_rg" {
  name = local.rg_name
  location = var.resource_group_location
  tags = local.common_tags
}
```

## Step-3: networking.tf
```t
# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  #name                = "myvnet-1"
  name                 = "${var.business_unit}-${var.environment}-${var.virtual_network_name}-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  tags = local.common_tags
}


```

## Step-4: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt
```
