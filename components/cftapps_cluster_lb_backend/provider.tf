provider "azurerm" {
  version = "=1.31.0"
}

provider "azurerm" {
  alias           = "data"
  subscription_id = var.data_subscription
}

provider "local" {
  version = "=1.3.0"
}

terraform {
  backend "azurerm" {}
}
