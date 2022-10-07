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

provider "azurerm" {
  alias = "control"
  features {}
  subscription_id = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
}

provider "local" {
  version = "=2.2.3"
}

