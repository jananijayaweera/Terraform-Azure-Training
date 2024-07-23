## Step-01: Input Variables Override with Environment Variables
- Set environment variables and execute `terraform plan` to see if it overrides default values 
```t
# Sample
export TF_VAR_variable_name=value

# SET Environment Variables
export TF_VAR_resource_group_name=demo-rg
export TF_VAR_resource_group_location=southeastasia
export TF_VAR_virtual_network_name=vnet-demo
export TF_VAR_subnet_name=subnet-1
export TF_VAR_environment=dev
echo $TF_VAR_resource_group_name, $TF_VAR_resource_group_location, $TF_VAR_virtual_network_name, $TF_VAR_subnet_name $TF_VAR_environment
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

# UNSET Environment Variables after demo
unset TF_VAR_resource_group_name
unset TF_VAR_resource_group_location
unset TF_VAR_virtual_network_name
unset TF_VAR_subnet_name
unset TF_VAR_environment
echo $TF_VAR_resource_group_name, $TF_VAR_resource_group_location, $TF_VAR_virtual_network_name, $TF_VAR_subnet_name $TF_VAR_environment
``