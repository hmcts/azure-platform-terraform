terraform {
  required_version = "1.13.3"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.47.0"
    }
  }
}


provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "azurerm" {
  alias           = "data"
  subscription_id = var.data_subscription
  features {}
}

provider "azurerm" {
  subscription_id = var.key_vault_subscription
  features {}
  alias = "kv"
}

provider "azurerm" {
  subscription_id            = local.hub[local.hub_env].subscription
  skip_provider_registration = "true"
  features {}
  alias = "hub"
}
