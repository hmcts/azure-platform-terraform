resource "azurerm_network_ddos_protection_plan" "main" {
  count               = "${length(var.firewall)}"
  name                = "ddospplan-${lookup(element(var.firewall, count.index), "location")}"
  location            = "${azurerm_resource_group.main[count.index].location}"
  resource_group_name = "${azurerm_resource_group.main[count.index].name}"
}

resource "azurerm_virtual_network" "main" {
  count               = length(var.firewall)
  name                = "hub-${var.env}-vnet"
  location            = "${azurerm_resource_group.main[count.index].location}"
  resource_group_name = "${azurerm_resource_group.main[count.index].name}"
  address_space       = ["${lookup(element(var.firewall, count.index), "hub_vnet")}"]

  ddos_protection_plan {
    id     = "${azurerm_network_ddos_protection_plan.main[count.index].id}"
    enable = true
  }

  tags = var.common_tags
}