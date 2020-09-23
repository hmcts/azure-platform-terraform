provider "azurerm" {
  version = "2.20.0"
  features {}
  skip_provider_registration = true
}

provider "azurerm" {
  alias = "data"
  features {}
  subscription_id = var.data_subscription
}

provider "local" {
  version = "=1.3.0"
}

terraform {
  backend "azurerm" {}
}
