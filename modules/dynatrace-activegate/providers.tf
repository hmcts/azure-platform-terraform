provider "azurerm" {
  alias = "log_analytics"
  features {}
  subscription_id = module.log_analytics_workspace.subscription_id
}
