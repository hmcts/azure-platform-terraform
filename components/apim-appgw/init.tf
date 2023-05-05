terraform {
  required_version = ">= 1.0.10"

  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.55.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  subscription_id            = local.hub["sbox"].subscription
  skip_provider_registration = "true"
  features {}
  alias = "hub-sbox"
}

provider "azurerm" {
  subscription_id            = local.hub["nonprod"].subscription
  skip_provider_registration = "true"
  features {}
  alias = "hub-nonprod"
}

provider "azurerm" {
  subscription_id            = local.hub["prod"].subscription
  skip_provider_registration = "true"
  features {}
  alias = "hub-prod"
}

provider "azurerm" {
  subscription_id            = var.key_vault_subscription
  skip_provider_registration = "true"
  features {}
  alias = "kv"
}