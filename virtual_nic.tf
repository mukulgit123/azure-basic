resource "azurerm_network_interface" "devnic" {
    name                = "${var.NIC}"
    location            = "${var.LOCATION}"
    resource_group_name = "${azurerm_resource_group.devrg.name}"
    network_security_group_id = "${azurerm_network_security_group.devsg.id}"

    ip_configuration {
        name                          = "${var.IP_CONFIGURATION}"
        subnet_id                     = "${azurerm_subnet.devsubnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.devpublicip.id}"
    }

    tags = {
        environment = "${var.ENVIRONMENT}"
    }
}