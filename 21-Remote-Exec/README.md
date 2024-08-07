
## Step-1: Introduction
- Understand about [remote-exec Provisioner](https://www.terraform.io/docs/language/resources/provisioners/remote-exec.html)
- The `remote-exec` provisioner invokes a script on a remote resource after it is created. 
- This can be used to run a configuration management tool, bootstrap into a cluster, etc. 


## Step-2: Review Terraform manifests & Execute Terraform Commands
```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Format
terraform fmt

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

# Verify
1) Login to Azure VM Instance
ssh -i ssh-keys/terraform-azure.pem azureuser@PUBLIC_IP_ADDRESSS_OF_YOUR_VM

2) Verify /tmp for file named file-copy.html all files copied (ls -lrt /tmp/file-copy.html)
3) Verify /var/www/html for a file named file-copy.html (ls -lrt /var/www/html/file-copy.html)
4) Access via browser http://<Public-IP>/file-copy.html
```
## Step-03: Clean-Up Resources & local working directory
```t
# Terraform Destroy
terraform destroy -auto-approve

# Delete Terraform files 
rm -rf .terraform*
rm -rf terraform.tfstate* 
```

