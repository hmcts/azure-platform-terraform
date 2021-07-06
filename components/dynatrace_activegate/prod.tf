module "dynatrace_activegate" {

  providers = {
    azurerm               = azurerm
    azurerm.log_analytics = azurerm.log_analytics_prod
  }

  source         = "../../modules/dynatrace-activegate"
  instance_count = 3
  network_zone   = "azure.cft"

  common_tags = module.ctags.common_tags
}