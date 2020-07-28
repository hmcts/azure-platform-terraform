provider "azurerm" {
  version = "2.20.0"
  features {}
}

provider "azurerm" {
  alias           = "data"
  features {}
  subscription_id = var.data_subscription
}

terraform {
  backend "azurerm" {}
}
