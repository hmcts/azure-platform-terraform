module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}

resource "azurerm_subnet" "api-mgmt-subnet" {
  name                 = "api-management"
  resource_group_name  = local.vnet_rg
  virtual_network_name = local.vnet_name
  address_prefixes     = [var.apim_subnet_address_prefix]

  lifecycle {
    ignore_changes = [address_prefix]
  }
}

module "api-mgmt" {
  source                         = "git::https://github.com/hmcts/cnp-module-api-mgmt-private.git?ref=main"
  location                       = var.location
  sku_name                       = var.apim_sku_name
  virtual_network_resource_group = azurerm_subnet.api-mgmt-subnet.resource_group_name
  virtual_network_name           = azurerm_subnet.api-mgmt-subnet.virtual_network_name
  environment                    = var.env
  virtual_network_type           = "Internal"
  department                     = var.department
  common_tags                    = module.ctags.common_tags
}

resource "azurerm_api_management_named_value" "environment" {
  name                = "environment"
  resource_group_name = local.vnet_rg
  api_management_name = module.api-mgmt.name
  display_name        = "environment"
  value               = var.env
}
