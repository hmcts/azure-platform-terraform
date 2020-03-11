locals {
  vnet_rg   = "aks-infra-${var.env}-rg"
  vnet_name = "core-${var.env}-vnet"
}

data "azurerm_subnet" "app_gw" {
  name                 = "aks-appgw"
  resource_group_name  = local.vnet_rg
  virtual_network_name = local.vnet_name
}

resource "azurerm_public_ip" "app_gw" {
  count = length(var.frontends) != 0 ? 1 : 0

  name                = "aks-fe-appgw-${var.env}-pip"
  location            = var.location
  resource_group_name = local.vnet_rg
  sku                 = "Standard"
  allocation_method   = "Static"

  tags = var.common_tags
}