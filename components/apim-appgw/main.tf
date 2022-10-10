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

data "azurerm_subscription" "sandbox" {
  subscription_id = "bf308a5c-0624-4334-8ff8-8dca9fd43783"
}

locals {
  key_vault_name = "acme${replace(lower(data.azurerm_subscription.sandbox.display_name), "-", "")}"
  dns_zone       = (var.env == "sbox") ? "sandbox" : var.env
}

data "azurerm_key_vault" "example" {
  provider            = azurerm.control
  name                = local.key_vault_name
  resource_group_name = "enterprise-${var.env}-rg"
}

module "app-gw" {

  providers = {
    azurerm     = azurerm
    azurerm.hub = azurerm.hub-sbox
    azurerm.kv  = azurerm.kv
  }

  source                     = "git::https://github.com/hmcts/terraform-module-apim-application-gateway.git?ref=DTSPO-9746/fix-kv"
  yaml_path                  = "${path.cwd}/../../environments/${local.env}/apim_appgw_config.yaml"
  env                        = local.dns_zone
  location                   = var.location
  private_ip_address         = var.hub_app_gw_private_ip_address
  backend_pool_ip_addresses  = var.apim_appgw_backend_pool_ips
  backend_pool_fqdns         = var.apim_appgw_backend_pool_fqdns
  key_vault_id                       = data.azurerm_key_vault.example.id
  vnet_rg                    = local.vnet_rg
  vnet_name                  = local.vnet_name
  common_tags                = module.ctags.common_tags
  log_analytics_workspace_id = module.logworkspace.workspace_id
  subnet_name                = local.subnet_name
  waf_mode                   = var.waf_mode
  exclusions                 = var.apim_appgw_exclusions
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