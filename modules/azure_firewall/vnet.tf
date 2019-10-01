resource "azurerm_network_ddos_protection_plan" "main" {
  count               = "${length(var.firewall_location)}"
  name                = "ddospplan-${element(var.firewall_location, count.index)}"
  location            = "${azurerm_resource_group.main[count.index].location}"
  resource_group_name = "${azurerm_resource_group.main[count.index].name}"
}

resource "azurerm_virtual_network" "main" {
  count               = "${length(var.firewall_location)}"
  name                = "hub-${var.env}-vnet"
  location            = "${azurerm_resource_group.main[count.index].location}"
  resource_group_name = "${azurerm_resource_group.main[count.index].name}"
  address_space       = ["${var.vnet_cidr[count.index]}"]

  ddos_protection_plan {
    id     = "${azurerm_network_ddos_protection_plan.main[count.index].id}"
    enable = true
  }

  tags = var.common_tags
}