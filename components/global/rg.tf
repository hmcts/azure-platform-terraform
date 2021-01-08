data "azurerm_resource_group" "main" {
  name = "lz-${var.env}-rg"
}

data "azurerm_resource_group" "key_vault" {
  name = var.env == "perftest" || var.env == "aat" || var.env == "preview" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}

# data "azurerm_log_analytics_workspace" "log" {
#   provider            = azurerm.loganalytics
#   name                = module.log_analytics_workspace.name #local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.env)][0]].name
#   resource_group_name = "oms-automation"
# }