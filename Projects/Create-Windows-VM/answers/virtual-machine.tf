
resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                            = "${local.resource_prefix}-vm"
  location                        = azurerm_resource_group.rg.location
  resource_group_name             = azurerm_resource_group.rg.name
  network_interface_ids           = [azurerm_network_interface.nic.id]
  size                            = var.vm_size
  admin_password                  = var.vm_password
  admin_username                  = var.username
  disable_password_authentication = false
  computer_name                   = "${local.resource_prefix}-vm"
  provision_vm_agent              = true
  
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.vm_diags.primary_blob_endpoint
  }
  source_image_reference {
    publisher = var.os_publisher
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }
  os_disk {
    name                 = "${local.resource_prefix}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = var.managed_disk_type
    disk_size_gb         = "30"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "${local.resource_prefix}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_storage_account" "vm_diags" {
  name                     = "${local.storage_account_prefix}diagsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sa_tier
  account_replication_type = var.sa_replication_type

}