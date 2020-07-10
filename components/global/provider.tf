provider "azurerm" {
  version = "1.43.0"
}

provider "azurerm" {
  alias           = "data"
  subscription_id = var.data_subscription
}

terraform {
  backend "azurerm" {}
}
