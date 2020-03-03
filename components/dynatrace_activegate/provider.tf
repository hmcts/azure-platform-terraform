provider "azurerm" {
  version = "2.0.0"
  features {}
}

terraform {
  backend "azurerm" {}
}
