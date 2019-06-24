provider "azurerm" {}

resource "azurerm_resource_group" "devrg" {
  name     = "${var.RESOURCE_GROUP}"
  location = "${var.LOCATION}"
   tags = {
        environment = "${var.ENVIRONMENT}"
    }
}


