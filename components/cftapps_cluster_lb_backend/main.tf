locals {
  env = "${(var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"}"
}

module "app-gw" {
  source    = "../../modules/app-gateway-module-backend"
  yaml_path = "${path.cwd}/../../environments/${local.env}/backend_lb_config.yaml"
  env       = var.env

  location           = var.location
  private_ip_address = var.app_gw_private_ip_address
  subscription       = var.subscription
  vault_name         = var.certificate_key_vault_name
}
