resource "azurerm_subnet" "devsubnet" {
    name                 = "${var.SUBNET_NAME}"
    resource_group_name  = "${azurerm_resource_group.devrg.name}"
    virtual_network_name = "${azurerm_virtual_network.devvnet.name}"
    address_prefix       = "10.0.2.0/24"
}