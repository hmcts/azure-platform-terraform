locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  criticality = {
    sbox     = "Low"
    aat      = "High"
    prod     = "High"
    ithc     = "Medium"
    perftest = "Medium"
    ldata    = "Medium"

  }

  env_display_names = {
    sbox     = "Sandbox"
    aat      = "Staging"
    prod     = "Production"
    ithc     = "ITHC"
    perftest = "Test"
    ldata    = "LDATA"
  }

  common_tags = {
    "managedBy"          = "Platform Operations"
    "solutionOwner"      = "CFT"
    "activityName"       = "AKS"
    "dataClassification" = "Internal"
    "automation"         = ""
    "costCentre"         = "10245117" // until we get a better one, this is the generic cft contingency one
    "environment"        = local.env_display_names[var.env]
    "criticality"        = local.criticality[var.env]
  }

  vnet_rg   = "aks-infra-${var.env}-rg"
  vnet_name = "core-${var.env}-vnet"

  key_vault_resource_group = var.env == "perftest" || var.env == "aat" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}

module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env

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
