resource "azurerm_virtual_network" "devvnet" {
    name                = "${var.VNET_NAME}"
    address_space       = ["10.0.0.0/16"]
    location            = "${var.LOCATION}"
    resource_group_name = "${azurerm_resource_group.devrg.name}"

    tags = {
        environment = "${var.ENVIRONMENT}"
    }
}