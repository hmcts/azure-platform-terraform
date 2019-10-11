resource "azurerm_dns_zone" "ithc_zone" {
  name                = "ithc.platform.hmcts.net"
  resource_group_name = data.azurerm_resource_group.main.name
}