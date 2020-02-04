module "shutter" {
  source                     = "../../modules/shutter_page"
  resource_group_name        = var.shutter_rg
  env                        = var.env
  shutter_apps               = var.frontends
  common_tags                = local.common_tags
  certificate_key_vault_name = var.certificate_key_vault_name
  subscription               = var.subscription
  cdn_profile                = azurerm_cdn_profile.main.name
}