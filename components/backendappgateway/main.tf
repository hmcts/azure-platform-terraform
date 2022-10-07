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

locals {
  key_vault_name = "acme${replace(lower(data.azurerm_subscription.current.display_name), "-", "")}"
  dns_zone       = (var.env == "sbox") ? "sandbox" : var.env
}

data "azurerm_key_vault" "example" {
  provider            = control
  name                = local.key_vault_name
  resource_group_name = "enterprise-${var.env}-rg"
}

module "backendappgateway" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=DTSPO-9746/fix-kv"

  yaml_path                          = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  env                                = local.dns_zone
  location                           = var.location
  private_ip_address                 = var.backend_agw_private_ip_address
  backend_pool_ip_addresses          = var.cft_apps_cluster_ips
  key_vault_id                       = data.azurerm_key_vault.example.id
  vnet_rg                            = local.vnet_rg
  vnet_name                          = local.vnet_name
  common_tags                        = module.ctags.common_tags
  log_analytics_workspace_id         = module.logworkspace.workspace_id
  enable_multiple_availability_zones = true
  resource_prefix                    = "cft"
}
