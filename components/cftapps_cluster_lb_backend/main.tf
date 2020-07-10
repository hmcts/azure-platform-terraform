locals {
  env = "${(var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"}"
}

module "app-gw" {
  source = "../../modules/app-gateway-module-backend"

  providers = {
    azurerm      = "azurerm"
    azurerm.data = "azurerm.data"
  }

  yaml_path = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  env       = var.env

  location                  = var.location
  private_ip_address        = var.app_gw_private_ip_address
  backend_pool_ip_addresses = var.cft_apps_cluster_ips
  subscription              = var.subscription
  vault_name                = var.certificate_key_vault_name
  oms_env                   = var.oms_env
}
