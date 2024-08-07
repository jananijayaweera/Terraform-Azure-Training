
## Step-1: Introduction
- We will build a Terraform local module to host a static website on Azure Storage Account. 
- We will understand how to call a Local Re-usable module in to a Root Module.
- We will understand how the local module variables becomes the arguments inside a module block when it is called in Root Module `static-webiste.tf`
- We will understand how we define the output values for a local module in a Root module `outputs.tf`


## Step-2: Create Module Folder Structure
- We are going to create `modules` folder and in that we are going to create a module named `azure-static-website`


## Step-3: Execute Terraform Commands
```t
# Terraform Initialize
terraform init
Observation: 
1. Verify ".terraform", you will find "modules" folder in addition to "providers" folder
2. Verify inside ".terraform/modules" folder too.

# Terraform Validate
terraform validate

# Terraform Format
terraform fmt

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

# Upload Static Content
1. Go to Storage Accounts -> staticwebsitexxxxxx -> Containers -> $web
2. Upload files from folder "static-content"

# Verify 
1. Azure Storage Account created
2. Static Website Setting enabled
3. Verify the Static Content Upload Successful
4. Access Static Website: Goto Storage Account -> staticwebsitek123 -> Data Management -> Static Website
5. Get the endpoint name `Primary endpoint`
https://staticwebsitek123.z13.web.core.windows.net/
```


## Step-08: Destroy and Clean-Up
```t
# Terraform Destroy
terraform destroy -auto-approve

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate*
```

## Step-09: Understand terraform get command
- We have used `terraform init` to download providers from terraform registry and at the same time to download `modules` present in local modules folder in terraform working directory. 
- Assuming we already have initialized using `terraform init` and later we have created `module` configs, we can `terraform get` to download the same.
- Whenever you add a new module to a configuration, Terraform must install the module before it can be used. 
- Both the `terraform get` and `terraform init` commands will install and update modules. 
- The `terraform init` command will also initialize backends and install plugins.
```t
# Delete modules in .terraform folder
ls -lrt .terraform/modules
rm -rf .terraform/modules
ls -lrt .terraform/modules

# Terraform Get
terraform get
ls -lrt .terraform/modules
```
## Step10: Major difference between Local and Remote Module
- When installing a remote module, Terraform will download it into the `.terraform` directory in your configuration's root directory. 
- When installing a local module, Terraform will instead refer directly to the source directory. 
- Because of this, Terraform will automatically notice changes to local modules without having to re-run `terraform init` or `terraform get`.



















