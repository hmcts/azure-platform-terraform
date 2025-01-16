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
  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"


  env                                = var.env
  subscription                       = var.subscription
  location                           = var.location
  private_ip_address                 = var.pubsub_frontend_agw_private_ip_address
  destinations                       = var.pubsub_endpoint
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
  app_gateway_name                   = "cft-fe-${var.env}-agw-pubsub"
  pip_name                           = "cft-pubsub-fe-appgw-${var.env}-pip"
  pubsub_subnet                      = true
  waf_policy_name                    = "pubsub-waf-policy"
  waf_managed_rules                  = var.pubsub_waf_managed_rules
}
