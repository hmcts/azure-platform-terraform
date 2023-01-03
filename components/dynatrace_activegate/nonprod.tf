module "nonprod_dynatrace_activegate" {

  providers = {
    azurerm     = azurerm
    azurerm.law = azurerm.law_nonprod
    azurerm.soc = azurerm.soc
  }

  source                  = "../../modules/dynatrace-activegate"
  instance_count          = 2
  dynatrace_instance_name = "yrk32651"
  env                     = "nonprod"
  network_zone            = "azure.cft"
  install_splunk_uf       = true
  enable_log_analytics    = true
  common_tags             = module.ctags.common_tags
}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
}