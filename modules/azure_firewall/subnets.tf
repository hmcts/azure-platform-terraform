resource "azurerm_subnet" "main" {
  count                = "${length(var.firewall_location)}"
  name                 = "AzureFirewallSubnet"
  resource_group_name  = "${azurerm_resource_group.main[count.index].name}"
  virtual_network_name = "${azurerm_virtual_network.main[count.index].name}"
  address_prefix       = "${cidrsubnet(element(var.vnet_cidr, count.index), 2, 2)}"
}

resource "azurerm_public_ip" "main" {
  count               = "${length(var.firewall_location)}"
  name                = "aksFW-${var.firewall_location[count.index]}-${var.env}-pip"
  location            = "${azurerm_resource_group.main[count.index].location}"
  resource_group_name = "${azurerm_resource_group.main[count.index].name}"
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "firewall-${var.env}"

  tags = var.common_tags
}