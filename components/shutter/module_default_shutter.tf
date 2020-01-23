module "default_shutter" {
  source                     = "../../modules/shutter_page"
  resource_group_name        = var.resource_group_name
  env                        = var.env
  shutter_storage            = var.shutter_storage
  frontends                  = var.frontends
  cdn_sku                    = var.cdn_sku
  common_tags                = local.common_tags
  certificate_key_vault_name = var.certificate_key_vault_name
}