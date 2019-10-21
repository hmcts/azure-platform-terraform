resource "azurerm_subnet" "main" {
  count                = length(var.firewall)
  name                 = "AzureFirewallSubnet"
  resource_group_name  = data.azurerm_resource_group.lz-fw[count.index].name
  virtual_network_name = azurerm_virtual_network.main[count.index].name
  address_prefix       = cidrsubnet(lookup(element(var.firewall, count.index), "hub_vnet"), 2, 2)
}

resource "azurerm_public_ip" "main" {
  count               = length(var.firewall)
  name                = "fw-${lookup(element(var.firewall, count.index), "location")}-${var.env}-pip"
  location            = data.azurerm_resource_group.lz-fw[count.index].location
  resource_group_name = data.azurerm_resource_group.lz-fw[count.index].name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "firewall-${var.env}"

  tags = var.common_tags
}