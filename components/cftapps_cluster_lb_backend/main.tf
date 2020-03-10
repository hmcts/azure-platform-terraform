module "app-gw" {
  source = "../../modules/app-gateway-module-backend"
  yaml_path = "${path.cwd}/../environments/${var.env}/all.yaml"
  env       = var.env

  location           = var.location
  private_ip_address = var.app_gw_private_ip_address
  subscription       = var.subscription
  vault_name         = var.vault_name
}
