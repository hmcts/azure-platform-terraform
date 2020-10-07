provider "azurerm" {
  version = "2.29.0"
  features {}
  skip_provider_registration = true
}

provider "azurerm" {
  alias = "data"
  features {}
  subscription_id = var.data_subscription
}

terraform {
  backend "azurerm" {}
}
