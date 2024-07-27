## Step-1: Introduction
- Implement complex type constructors like `list` 


## Step-2: Implement complex type cosntructors like `list` 
- [Type Constraints](https://www.terraform.io/docs/language/expressions/types.html)

- List or tuple: a array of values, like ["10.0.0.0/16", "10.1.0.0/16", 10.2.0.0/16]
- Elements in a list or tuple are identified by consecutive whole numbers, starting with zero. so, the first element is at index 0, the second element is at index 1, and so on.
- List or tuple elements can be accessed using square brackets, like `mylist[0]` to access the first element of a list or tuple.

- In this example we are going to assign multiple address spaces to virtual network `virtual_network_address_space`
### variables.tf
```t
variable "virtual_network_address_space" {
  description = "Virtual Network Address Space"
  type = list(string)
  default = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}
```
### terraform.tfvars
```t
business_unit = "it"
environment = "dev"
resource_group_name = "rg-list"
resource_group_location = "southeastasia"
virtual_network_name = "vnet-list"
subnet_name = "subnet-list"
virtual_network_address_space = ["10.3.0.0/16", "10.4.0.0/16", "10.5.0.0/16"]
```

## Step-3: Update the variable in networking.tf
```t
resource "azurerm_virtual_network" "myvnet" {
  name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  address_space       = var.virtual_network_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
```

## Step-4: Update subnet range
```t
resource "azurerm_subnet" "mysubnet" {
  #name                 = var.subnet_name
  name                 = "${azurerm_virtual_network.myvnet.name}-${var.subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.3.0.0/24"]
}
```

## Step-06: Execute Terraform Commands
```t
# Initialize Terraform
terraform init

# Validate Terraform configuration files
terraform validate

# Format Terraform configuration files
terraform fmt

# Review the terraform plan
terraform plan 

# Terraform Apply
terraform apply -auto-approve

```

## Step-7: Update networking.tf
```t
resource "azurerm_virtual_network" "myvnet" {
  name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  #address_space      = ["10.0.0.0/16"]
  #address_space       = var.virtual_network_address_space
  address_space       = [var.virtual_network_address_space[0]] # First Element of the virtual_network_address_space
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
}
```

## Step-9: Execute Terraform Commands
```t
# Terraform Plan
terraform plan 

# Terraform Apply
terraform apply -auto-approve

```

## References
- [Terraform Input Variables](https://www.terraform.io/docs/language/values/variables.html)