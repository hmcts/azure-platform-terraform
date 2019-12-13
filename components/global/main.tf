module "landing_zone" {
  source                     = "../../modules/azure-landing-zone/"
  common_tags                = local.common_tags
  env                        = var.env
  subscription               = var.subscription
  project                    = var.project
  component                  = var.component
  location                   = var.location
  waf_mode                   = var.waf_mode
  frontends                  = var.frontends
  enable_ssl                 = var.enable_ssl
  ssl_mode                    = var.ssl_mode
  resource_group             = data.azurerm_resource_group.main.name
  subscription_id            = data.azurerm_subscription.current.subscription_id
  certificate_key_vault_name = var.certificate_key_vault_name
}