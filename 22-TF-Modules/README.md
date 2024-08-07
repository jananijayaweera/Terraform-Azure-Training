
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











