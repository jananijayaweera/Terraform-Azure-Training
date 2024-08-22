
### Usecase
- We will implement 4 environments (dev, qa, staging and prod) using single set of templates 
- We will use `for_each` and `set` combination to do that. 
- For each environment, Resources will be created with single set of Terraform Configs

## Pre-requisites - SSH Keys
- Create SSH Keys for Azure VM Instance if not created
```t
# Create Folder
mkdir ssh-keys

# Create SSH Key
cd ssh-ekys
ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f terraform-azure.pem 

# List Files
ls -lrt ssh-keys/

# Permissions for Pem file
chmod 400 terraform-azure.pem


## Step-1: Implement complex type cosntructors like `list` 
### sets: 
1. Sets do not support element ordering, meaning that traversing sets is not guaranteed to yield the same order each time and that their elements can not be accessed in a targeted way. 
- They contain unique elements repeated exactly once, and specifying the same element multiple times will result in them being coalesced with only one instance being present in the set.
- Declaring a set is similar to declaring a list, the only difference being the type of the variable:
```t
# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type = set(string)
  default = ["dev1", "qa1", "staging1", "prod1"]
}
```

## Step-2: variables.tf
- Define the Input Variable Type `set` for environment.
```t
# 2. Environment Name
variable "environment" {
  description = "Environment Name"
  type = set(string)
  default = ["dev1", "qa1", "staging1", "prod1"]
}
```

## Step-3: terraform.tfvars
- Core focus on variables will be on `environment` variable of type `set`
- Rest variables are hard-coded in those respective resources. 
- Review `environment` variable in `terraform.tfvars`
```t
business_unit = "it"
environment = ["dev2", "qa2", "staging2", "prod2"]
resource_group_name = "rg"
```

## Step-4: providers.tf
- As we are going to create 4 environments, our Random String Resource also need to be traversed in `for_each` loop to create 4 random strings per environment
- Create 4 Random Strings using `for_each` with `set` variable `var.environment`
```t
# Random String Resource
resource "random_string" "random" {
  for_each = var.environment
  length = 6
  upper = false 
  special = false
  number = false   
}
```

## Step-5: rg.tf
- Create 4 Resource Groups using `for_each` with `set` variable `var.environment`
```t
# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  for_each = var.environment
  name = "${var.business_unit}-${each.key}-${var.resoure_group_name}"
  location = var.resource_group_location
}
```

## Step-6: networking.tf - Virtual Network
- Create 4 Virtual Networks using `for_each` with `set` variable `var.environment`
- One Virtual Network will be created in each Resource Group
```t
# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  for_each = var.environment
  name                = "${var.business_unit}-${each.key}-${var.virtual_network_name}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name
}
```

## Step-7: networking.tf - Subnet
- Create 4 Subnets using `for_each` with `set` variable `var.environment`
- One Subnet will be created in each Virtual Network
```t
# Create Subnet
resource "azurerm_subnet" "subnet" {
  for_each = var.environment
  name = "${var.business_unit}-${each.key}-${var.virtual_network_name}-subnet"
  resource_group_name  = azurerm_resource_group.rg[each.key].name
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  address_prefixes     = ["10.0.2.0/24"]
}
```
## Step-8: Execute Terraform Commands
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