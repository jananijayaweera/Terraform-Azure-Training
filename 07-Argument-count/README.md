## Pre-requisites - SSH Keys
- Create SSH Keys for Azure VM Instance if not created
```t
# Create Folder
cd terraform-manifests/
mkdir ssh-keys

# Create SSH Key
cd ssh-ekys
ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f terraform-azure.pem 

# List Files
ls -lrt ssh-keys/

# Permissions for Pem file
chmod 400 terraform-azure.pem
