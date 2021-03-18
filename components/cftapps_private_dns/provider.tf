terraform {
  required_version = ">= 0.13.0"
  backend "azurerm" {
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
