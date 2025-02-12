data "azurerm_subscription" "current" {}

locals {
  key_vault_name = "acme${replace(lower(data.azurerm_subscription.current.display_name), "-", "")}"
}

moved {
  from = module.premium_front_door[0]
  to   = module.premium_front_door
}
module "premium_front_door" {
  source = "git::https://github.com/hmcts/terraform-module-frontdoor.git?ref=platops/23355-FD-policyupdate"

  common_tags                = module.ctags.common_tags
  env                        = var.env
  project                    = var.project
  location                   = var.location
  frontends                  = var.frontends
  ssl_mode                   = var.ssl_mode
  resource_group             = data.azurerm_resource_group.main.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = local.key_vault_name
  certificate_name_check     = var.certificate_name_check
  key_vault_resource_group   = data.azurerm_resource_group.key_vault.name
  log_analytics_workspace_id = module.log_analytics_workspace.workspace_id
  add_access_policy          = var.add_access_policy

  diagnostics_storage_account_id    = azurerm_storage_account.diagnostics.id
  send_access_logs_to_log_analytics = false
}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

