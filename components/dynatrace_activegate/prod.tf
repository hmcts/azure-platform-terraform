# module "dynatrace_activegate" {

#   providers = {
#     azurerm     = azurerm
#     azurerm.law = azurerm.law_prod
#     azurerm.soc = azurerm.soc
#   }

#   source               = "../../modules/dynatrace-activegate"
#   instance_count       = 3
#   network_zone         = "azure.cft"
#   install_splunk_uf    = true
#   enable_log_analytics = true
#   common_tags          = module.ctags.common_tags
# }