module "cftapps-frontend-cluster-lb" {
  source = "../../modules/app-gateway-module"

  destinations        = var.cft_apps_cluster_ips
  env                = var.env
  frontends          = var.frontends
  location           = var.location
  private_ip_address = var.cft_apps_ag_ip_address
  subscription       = var.subscription
  vault_name         = var.certificate_key_vault_name
}