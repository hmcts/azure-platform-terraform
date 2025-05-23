module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env
}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
  autoShutdown = var.autoShutdown
}

data "azurerm_subscription" "current" {}

module "pubsubappgateway" {

  providers = {
    azurerm     = azurerm
    azurerm.kv  = azurerm.kv
    azurerm.hub = azurerm.hub
  }

  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"

  count = var.env == "sbox" ? 0 : 1

  env                                = var.env
  subscription                       = var.subscription
  location                           = var.location
  private_ip_address                 = var.pubsub_frontend_agw_private_ip_address
  frontends                          = var.pubsub_frontends
  common_tags                        = module.ctags.common_tags
  oms_env                            = var.oms_env
  project                            = var.project
  vnet_rg                            = local.vnet_rg
  vnet_name                          = local.vnet_name
  log_analytics_workspace_id         = module.logworkspace.workspace_id
  enable_multiple_availability_zones = true
  resource_prefix                    = "cft"
  min_capacity                       = var.frontend_agw_min_capacity
  max_capacity                       = var.frontend_agw_max_capacity
  diagnostics_storage_account_id     = data.azurerm_storage_account.diagnostics.id
  enable_waf                         = true
  app_gateway_name                   = "cft-pubsub${format("%02d", count.index)}-${var.env}-agw"
  pip_name                           = "cft-pubsub-appgw-${var.env}-pip"
  pubsub_subnet                      = true
  waf_policy_name                    = "cft-pubsub-waf-policy"
  waf_managed_rules                  = var.pubsub_waf_managed_rules
  ssl_enable                         = true
  pubsubappgw_ssl_policy             = var.pubsubappgw_ssl_policy
  ssl_certificate_name               = var.ssl_certificate
  vault_name                         = local.key_vault_name
  key_vault_resource_group           = local.key_vault_resource_group
}
