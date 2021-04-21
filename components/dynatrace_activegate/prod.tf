module "dynatrace_activegate" {
  source         = "../../modules/dynatrace-activegate"
  instance_count = 3
  network_zone   = "azure.cft"

  common_tags = module.ctags.common_tags
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}