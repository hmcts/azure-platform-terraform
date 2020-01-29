module "sscstribunals" {
  source                     = "../../modules/shutter_page"
  resource_group_name        = var.resource_group_name
  env                        = var.env
  shutter_storage            = "sscssya"
  frontends                  = var.frontends
  common_tags                = local.common_tags
  certificate_key_vault_name = var.certificate_key_vault_name
  subscription               = var.subscription
  cdn_profile                = azurerm_cdn_profile.main.name
}

module "sscstya" {
  source                     = "../../modules/shutter_page"
  resource_group_name        = var.resource_group_name
  env                        = var.env
  shutter_storage            = "sscstya"
  frontends                  = var.frontends
  common_tags                = local.common_tags
  certificate_key_vault_name = var.certificate_key_vault_name
  subscription               = var.subscription
  cdn_profile                = azurerm_cdn_profile.main.name
}

module "sscscor" {
  source                     = "../../modules/shutter_page"
  resource_group_name        = var.resource_group_name
  env                        = var.env
  shutter_storage            = "sscscor"
  frontends                  = var.frontends
  common_tags                = local.common_tags
  certificate_key_vault_name = var.certificate_key_vault_name
  subscription               = var.subscription
  cdn_profile                = azurerm_cdn_profile.main.name
}