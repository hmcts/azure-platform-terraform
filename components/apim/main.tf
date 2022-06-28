module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}

module "api-mgmt" {
  source                         = "git::https://github.com/hmcts/cnp-module-api-mgmt-private.git?ref=terraform-azurerm-v3"
  location                       = var.location
  sku_name                       = var.apim_sku_name
  virtual_network_resource_group = local.vnet_rg
  virtual_network_name           = local.vnet_name
  environment                    = var.env
  virtual_network_type           = "Internal"
  department                     = var.department
  common_tags                    = module.ctags.common_tags
  route_next_hop_in_ip_address   = local.hub[var.hub].ukSouth.next_hop_ip
}

resource "azurerm_api_management_named_value" "environment" {
  name                = "environment"
  resource_group_name = local.vnet_rg
  api_management_name = module.api-mgmt.name
  display_name        = "environment"
  value               = var.env
}
