module "default_shutter" {
  source                     = "../../modules/shutter_page"
  resource_group_name        = var.resource_group_name
  env                        = var.env
  shutter_storage            = var.shutter_storage
  shutter_apps               = var.default_shutter
  common_tags                = local.common_tags
  certificate_key_vault_name = var.certificate_key_vault_name
  subscription               = var.subscription
  cdn_profile                = azurerm_cdn_profile.main.name
}