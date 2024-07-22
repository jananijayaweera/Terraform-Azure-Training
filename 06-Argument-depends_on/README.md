

## Step-01: Execute Terraform commands in manifests
```t
# Directory Change
cd manifests

# Initialize Terraform
terraform init

# Terraform Validate
terraform validate

# Terraform Plan 
terraform plan

# Terraform Apply 
terraform apply or terraform apply -auto-approve

# Terraform Destroy 
terraform destroy -auto-approve

# Clean-Up
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Step-02: Public IP  Resource is dependent on Virtual Network and Subnet Resource
```t

# Create Public IP Address
resource "azurerm_public_ip" "publicip" {
  # Add Explicit Dependency on Virtual Network and Subnet
  depends_on = [
    azurerm_virtual_network.vnet,
    azurerm_subnet.subnet
  ]
  name                = "mypublicip-1"
  resource_group_name = azurerm_resource_group.rg_depends_on.name
  location            = azurerm_resource_group.rg_depends_on.location
  allocation_method   = "Static"
  domain_name_label = "test1-vm-${random_string.randomString.result}"
  tags = {
    environment = "Dev"
  }
}
```


# Observation
1. Public IP Resource will get created only after Virtual Network and Subnet Resource got created.
2. This is achieved by specifying explicit dependency using `depends_on` meta-argument.
3. This explicit dependency is not required for Virtual Network and Subnet as they need explicit dependency on each other.

# Terraform Destroy
```t
terraform destroy -auto-approve
```
# Clean-Up
```t
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## References 
1. [Azure Resource Group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
2. [Azure Virtual Network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
3. [Azure Subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)
4. [Azure Public IP](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip)
5. [Azure Network Interface](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface)
