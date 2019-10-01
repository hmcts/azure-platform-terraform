data "azurerm_public_ip" "pip" {
  count               = "${length(var.firewall_location)}"
  name                = "${azurerm_public_ip.main[count.index].name}"
  resource_group_name = "${azurerm_public_ip.main[count.index].resource_group_name}"
}
