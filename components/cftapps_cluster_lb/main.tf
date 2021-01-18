module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env

}

module "cftapps-frontend-cluster-lb" {
  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"

  env                        = var.env
  subscription               = var.subscription
  vault_name                 = var.certificate_key_vault_name
  location                   = var.location
  private_ip_address         = var.cft_apps_ag_ip_address
  destinations               = var.cft_apps_cluster_ips
  frontends                  = var.frontends
  common_tags                = local.common_tags
  oms_env                    = var.oms_env
  project                    = var.project
  vnet_rg                    = local.vnet_rg
  vnet_name                  = local.vnet_name
  log_analytics_workspace_id = module.logworkspace.workspace_id
  store_privateip            = true

}