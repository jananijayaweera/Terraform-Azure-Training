# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
  tags = {
    "Name" = "VNET-1"
    "Environment" = "Dev12"
  }
  /*
  # Lifecycle Changes
  lifecycle {
    ignore_changes = [ tags, ]
  }
*/
}



/*

# Without the lifecycle block, the tags will be updated

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  ~ update in-place

Terraform will perform the following actions:

  # azurerm_virtual_network.myvnet will be updated in-place
  ~ resource "azurerm_virtual_network" "myvnet" {
        id                      = "/subscriptions/<SubName>/resourceGroups/rg-tf-lifecycle-ignore-changes/providers/Microsoft.Network/virtualNetworks/myvnet-1"
        name                    = "myvnet-1"
      ~ tags                    = {
          ~ "Environment" = "Dev1" -> "Dev12"
            "Name"        = "VNET-1"
        }
        # (9 unchanged attributes hidden)
    }

Plan: 0 to add, 1 to change, 0 to destroy.

######################################################################

# With the lifecycle block, the tags will not be updated

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.

*/