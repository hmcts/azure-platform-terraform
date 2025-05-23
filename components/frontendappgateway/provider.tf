terraform {
  required_version = ">= 0.13"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
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
  subscription_id            = var.key_vault_subscription
  skip_provider_registration = "true"
  features {}
  alias = "kv"
}

provider "azurerm" {
  subscription_id            = local.hub[local.hub_env].subscription
  skip_provider_registration = "true"
  features {}
  alias = "hub"
}
