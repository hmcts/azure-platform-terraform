terraform {
  required_version = "1.13.3"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias = "data"
  features {}
  subscription_id = var.data_subscription
}

provider "local" {
  version = "2.6.1"
}

