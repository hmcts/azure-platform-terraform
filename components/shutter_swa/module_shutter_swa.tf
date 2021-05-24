module "shutter_swa" {
  source              = "../../modules/shutter_page_swa"
  resource_group_name = var.shutter_rg
  env                 = var.env
  shutter_apps        = var.frontends
  common_tags         = module.ctags.common_tags
  subscription        = var.subscription
  shutter_rg          = var.shutter_rg
  repositoryUrl       = var.repository_url
  location            = var.location
}

module "ctags" {
  source      = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment = var.env
  product     = var.product
  builtFrom   = var.builtFrom
}
