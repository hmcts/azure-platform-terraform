
module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

module "api-mgmt" {
  source              = "git::https://github.com/hmcts/terraform-module-application-insights?ref=main"
  location            = var.location
  common_tags         = module.ctags.common_tags
  env                 = var.env
  product             = var.product
  name                = "${var.department}-api-mgmt"
  resource_group_name = var.virtual_network_resource_group
}

resource "azurerm_api_management_named_value" "environment" {
  name                = "environment"
  resource_group_name = local.vnet_rg
  api_management_name = module.api-mgmt.name
  display_name        = "environment"
  value               = var.env
}
