# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "demolinuxvm" {
  count = 2 # Use count argument to create multiple VMs
  name                = "linuxvm-${count.index}"
  computer_name       = "linuxdev-${count.index}" # Use count.index to create unique computer names
  resource_group_name = azurerm_resource_group.demo_rg.name
  location            = azurerm_resource_group.demo_rg.location
  size                = "Standard_DS1_v2"
  admin_username      = "localadmin"
  network_interface_ids = [ element(azurerm_network_interface.vmnic[*].id, count.index)]  
  admin_ssh_key {
    username   = "localadmin"
    public_key = file("${path.module}/ssh-keys/vm-ssh-key.pub")
  }
  os_disk {
    name = "osdisk${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }
  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}


