module "probate_shutter" {
  source              = "../../modules/shutter_page"
  resource_group_name = var.resource_group_name
  env                 = var.env
  shutter_storage     = var.probate_shutter_storage
  shutter_apps        = var.probate_shutter_apps
  cdn_sku             = var.cdn_sku
  common_tags         = local.common_tags
}