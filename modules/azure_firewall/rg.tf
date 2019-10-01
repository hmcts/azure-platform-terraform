resource "azurerm_resource_group" "main" {
  count    = "${length(var.firewall_location)}"
  name     = "hub-${var.env}-${element(var.firewall_location, count.index)}"
  location = "${element(var.firewall_location, count.index)}"

  tags = "${var.common_tags}"
}