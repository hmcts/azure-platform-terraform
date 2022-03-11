terraform {
  required_version = ">= 1.0.10"

  backend "azurerm" {
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.82.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  subscription_id = local.hub["sbox"].subscription
  features {}
  alias = "hub-sbox"
}

provider "azurerm" {
  subscription_id = local.hub["nonprod"].subscription
  features {}
  alias = "hub-nonprod"
}

provider "azurerm" {
  subscription_id = local.hub["prod"].subscription
  features {}
  alias = "hub-prod"
}