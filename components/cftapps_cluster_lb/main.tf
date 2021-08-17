module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env

}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}

data "azurerm_subscription" "current" {}

module "cftapps-frontend-cluster-lb" {
  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"

  env                        = var.env
  subscription               = var.subscription
  location                   = var.location
  private_ip_address         = var.cft_apps_ag_ip_address
  destinations               = var.cft_apps_cluster_ips
  frontends                  = var.frontends
  common_tags                = module.ctags.common_tags
  oms_env                    = var.oms_env
  project                    = var.project
  vnet_rg                    = local.vnet_rg
  vnet_name                  = local.vnet_name
  log_analytics_workspace_id = module.logworkspace.workspace_id

}
