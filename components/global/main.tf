module "landing_zone" {
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=master"

  providers = {
    azurerm      = azurerm
    azurerm.data = azurerm.data
  }

  common_tags                = module.ctags.common_tags
  env                        = var.env
  subscription               = var.subscription
  project                    = var.project
  location                   = var.location
  frontends                  = var.frontends
  ssl_mode                   = var.ssl_mode
  resource_group             = data.azurerm_resource_group.main.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = var.certificate_key_vault_name
  oms_env                    = var.oms_env
  certificate_name_check     = var.certificate_name_check
  key_vault_resource_group   = data.azurerm_resource_group.key_vault.name
  log_analytics_workspace_id = module.log_analytics_workspace.workspace_id
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}