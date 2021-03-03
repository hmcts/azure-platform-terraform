locals {
  env                      = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"
  key_vault_resource_group = var.env == "perftest" || var.env == "aat" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}

module "app-gw" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=DTSPO-1355"

  providers = {
    azurerm      = "azurerm"
    azurerm.data = "azurerm.data"
  }

  yaml_path = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  env       = var.env

  location                   = var.location
  private_ip_address         = var.app_gw_private_ip_address
  backend_pool_ip_addresses  = var.cft_apps_cluster_ips
  subscription               = var.subscription
  vault_name                 = var.certificate_key_vault_name
  oms_env                    = var.oms_env
  vnet_rg                    = local.vnet_rg
  vnet_name                  = local.vnet_name
  common_tags                = local.common_tags
  log_analytics_workspace_id = module.logworkspace.workspace_id
  key_vault_resource_group   = local.key_vault_resource_group

}
