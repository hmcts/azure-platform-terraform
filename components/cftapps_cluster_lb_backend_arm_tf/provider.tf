terraform {
  required_version = ">= 0.13.0"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.58.0"
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

provider "local" {
  version = "=2.2.3"
}


provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = var.privatedns_subscription
  alias                      = "privatedns"
}
