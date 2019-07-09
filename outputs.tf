output "IP_FQDN" {
  value = "${azurerm_public_ip.devpublicip.fqdn}"
  description = "FQDN"
}

output "IP_PUBLIC" {
  value = "${azurerm_public_ip.devpublicip.ip_address}"
}