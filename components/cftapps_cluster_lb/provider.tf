provider "azurerm" {
  version = "1.41.0"
}

terraform {
  backend "azurerm" {}
}
