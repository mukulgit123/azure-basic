resource "azurerm_virtual_machine" "devvm" {
    name                  = "${var.VIRTUAL_MACHINE}"
    location              = "${var.LOCATION}"
    resource_group_name   = "${azurerm_resource_group.devrg.name}"
    network_interface_ids = ["${azurerm_network_interface.devnic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "${var.COMPUTER_NAME}"
        admin_username = "${var.ADMIN_USER}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "${var.AKS_SSH_ADMIN_KEY}"
        }
    }
    
    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.devstorage.primary_blob_endpoint}"
    }

    provisioner "remote-exec" {
    inline = [
      "apt-get update",
      "apt install git",
      "git clone https://github.com/ppuch/HelmCharts.git",
      "git clone https://github.com/ppuch/ASGCloudDeployment.git"
    ]
  }

     tags = {
        environment = "${var.ENVIRONMENT}"
    }
}