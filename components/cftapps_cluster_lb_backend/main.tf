data "azurerm_log_analytics_workspace" "log_analytics" {
  provider = "azurerm.data"

  name                = "hmcts-${var.oms_env}"
  resource_group_name = "oms-automation"
}

module "app-gw" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=remove-unused-variables"

  providers = {
    azurerm      = "azurerm"
    azurerm.data = "azurerm.data"
  }

  yaml_path                  = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  env                        = var.env
  location                   = var.location
  private_ip_address         = var.app_gw_private_ip_address
  backend_pool_ip_addresses  = var.cft_apps_cluster_ips
  vault_name                 = var.certificate_key_vault_name
  vnet_rg                    = local.vnet_rg
  vnet_name                  = local.vnet_name
  common_tags                = local.common_tags
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id
  key_vault_resource_group   = local.key_vault_resource_group

}
