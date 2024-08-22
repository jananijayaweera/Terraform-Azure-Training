#!/bin/sh

az login

# Variables
export resourceGroupName="tf-class-01-rg"
export location="southeastasia"
export storageAccountName="tf01storagekasun"
export sku="Standard_LRS"

# Create resource group
az group create --name $resourceGroupName --location $location

# Create storage account
az storage account create --name $storageAccountName --resource-group $resourceGroupName --location $location --sku $sku


