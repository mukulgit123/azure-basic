resource "azurerm_public_ip" "devpublicip" {
    name                         = "${var.PUBLIC_IP}"
    location                     = "${var.LOCATION}"
    resource_group_name          = "${azurerm_resource_group.devrg.name}"
    allocation_method            = "Static"

    tags = {
        environment = "${var.ENVIRONMENT}"
    }
}