module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom

}

module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env

}

data "azurerm_subscription" "current" {}

locals {
  key_vault_name = "acme${replace(lower(data.azurerm_subscription.current.display_name), "-", "")}"
  dns_zone       = (var.env == "sbox") ? "sandbox" : var.env
}

module "cftapps-websockets-lb" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=changes-for-apim-appgw"

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
  subnet_name                = local.subnet_name
  log_analytics_workspace_id = module.logworkspace.workspace_id
  waf_mode                   = var.waf_mode

}

module "app-gw" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=master"

  yaml_path                  = "${path.cwd}/../../environments/${local.env}/apim_appgw_config.yaml"
  env                        = local.dns_zone
  location                   = var.location
  private_ip_address         = var.app_gw_private_ip_address
  backend_pool_ip_addresses  = var.cft_apps_cluster_ips
  vault_name                 = local.key_vault_name
  vnet_rg                    = local.vnet_rg
  vnet_name                  = local.vnet_name
  common_tags                = module.ctags.common_tags
  log_analytics_workspace_id = module.logworkspace.workspace_id
  key_vault_resource_group   = local.key_vault_resource_group
  waf_mode                   = var.waf_mode

}

resource "azurerm_route_table" "apim_route_table" {
  name                = "apim-${var.environment}"
  resource_group_name = local.vnet_rg
  location            = var.location
}

resource "azurerm_route" "to_palo_route" {
  name                   = "to_palo"
  route_table_name       = azurerm_route_table.apim_route_table.name
  resource_group_name    = local.vnet_rg
  address_prefix         = local.apim[var.env].dest_ip
  next_hop_type          = var.route_next_hop_type
  next_hop_in_ip_address = local.hub[var.hub].ukSouth.next_hop_ip
}
