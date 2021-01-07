terraform {
  required_version = ">= 0.14.4"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      # https://github.com/terraform-providers/terraform-provider-azurerm/issues/8208
      version = "2.41.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

provider "azurerm" {
  alias = "data"
  features {}
  subscription_id = var.data_subscription
}

provider "azurerm" {
  features {}
  alias           = "loganalytics"
  subscription_id = local.log_analytics_workspace[[for x in keys(local.log_analytics_env_mapping) : x if contains(local.log_analytics_env_mapping[x], var.env)][0]].subscription_id
}
