# Output Values for Resource Group Resource
output "resource_group_id" {
  description = "Resource Group ID"
  value = azurerm_resource_group.rg.id 
}
output "resource_group_name" {
  description = "Resource Group Name"
  value = azurerm_resource_group.rg.name
}

# 2. Output Values for Virtual Network Resource
output "virtual_network_name" {
  description = "Virtal Network Name"
  value = azurerm_virtual_network.vnet.name  
}


