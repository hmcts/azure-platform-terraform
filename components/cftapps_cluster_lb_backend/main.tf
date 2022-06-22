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

module "app-gw" {
  source = "git::https://github.com/hmcts/terraform-module-application-backend.git?ref=terraform-azurerm-v3-cft"

  yaml_path                                            = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  env                                                  = local.dns_zone
  location                                             = var.location
  private_ip_address                                   = var.app_gw_private_ip_address
  backend_pool_ip_addresses                            = var.cft_apps_cluster_ips
  vault_name                                           = local.key_vault_name
  vnet_rg                                              = local.vnet_rg
  vnet_name                                            = local.vnet_name
  common_tags                                          = module.ctags.common_tags
  log_analytics_workspace_id                           = module.logworkspace.workspace_id
  key_vault_resource_group                             = local.key_vault_resource_group
  backend_public_ip_enable_multiple_availability_zones = var.backend_public_ip_enable_multiple_availability_zones

}
