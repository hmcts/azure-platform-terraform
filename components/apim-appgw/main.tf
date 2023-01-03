module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}

module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env

}

data "azurerm_subscription" "current" {}

locals {
  key_vault_name = "acmedcdcftapps${var.subscription}"
  dns_zone       = (var.env == "sbox") ? "sandbox" : var.env
}

module "app-gw" {

  providers = {
    azurerm     = azurerm
    azurerm.hub = azurerm.hub-sbox
    azurerm.kv  = azurerm.kv
  }

  source                                       = "git::https://github.com/hmcts/terraform-module-apim-application-gateway.git?ref=main"
  yaml_path                                    = "${path.cwd}/../../environments/${local.env}/apim_appgw_config.yaml"
  env                                          = local.dns_zone
  location                                     = var.location
  private_ip_address                           = var.hub_app_gw_private_ip_address
  backend_pool_ip_addresses                    = var.apim_appgw_backend_pool_ips
  backend_pool_fqdns                           = var.apim_appgw_backend_pool_fqdns
  vault_name                                   = local.key_vault_name
  vnet_rg                                      = local.vnet_rg
  vnet_name                                    = local.vnet_name
  common_tags                                  = module.ctags.common_tags
  log_analytics_workspace_id                   = module.logworkspace.workspace_id
  key_vault_resource_group                     = local.key_vault_resource_group
  subnet_name                                  = local.subnet_name
  waf_mode                                     = var.waf_mode
  exclusions                                   = var.apim_appgw_exclusions
  public_ip_enable_multiple_availability_zones = true
}

resource "azurerm_route_table" "apim_route_table" {
  name                = "apim-${var.env}"
  resource_group_name = local.vnet_rg
  location            = var.location
}

resource "azurerm_route" "to_az_firewall_route" {
  name                   = "to_az_firewall"
  route_table_name       = azurerm_route_table.apim_route_table.name
  resource_group_name    = local.vnet_rg
  address_prefix         = local.apim[var.env].dest_ip
  next_hop_type          = var.route_next_hop_type
  next_hop_in_ip_address = local.hub[var.env].ukSouth.appgw_next_hop_ip
}

data "local_file" "configuration" {
  filename = "${path.cwd}/../../environments/${local.env}/apim_appgw_config.yaml"
}