provider "azurerm" {
  alias   = "log_analytics"
  version = "= 2.31.1"
  features {}
  subscription_id = module.log_analytics_workspace.subscription_id
}