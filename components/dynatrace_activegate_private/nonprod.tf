module "nonprod_dynatrace_activegate_private" {
  source                  = "../../modules/dynatrace-activegate_private"
  instance_count          = 2
  dynatrace_instance_name = "yrk32651"
  env                     = "nonprod"
  # network_zone            = "azure.cft"

  common_tags = module.ctags.common_tags
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}