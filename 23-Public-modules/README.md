
## Step-1: Defining a Public Module
- Public modules are modules that are published in the Terraform Registry.

- We need to understand about the following
1. First we need to specify the source of the module (Azure/vnet/azurerm)
2. Then we need to specify the version of the module
- [Azure VNET Terraform Module](https://registry.terraform.io/modules/Azure/vnet/azurerm/latest)

Following is an example of how to use the Azure VNET Terraform Module. When using public modules, its advisable to refer the documentation of the module to understand the input variables and output values.
```t
module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "4.1.0"
  vnet_name           = local.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
  vnet_location       = azurerm_resource_group.rg.location
  use_for_each        = var.use_for_each
  subnet_service_endpoints = {
    subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
    subnet3 = ["Microsoft.AzureActiveDirectory"]
  }
  tags = {
    environment = "dev"
    costcenter  = "it"
  }
  depends_on = [azurerm_resource_group.rg]
}
```

## Step-2: Execute Terraform Commands
```t
# Terraform Init
terraform init

# Terraform Validate
terraform validate

# Terraform Format
terraform fmt

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-apporve
```

