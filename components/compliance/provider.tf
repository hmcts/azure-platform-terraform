provider "azurerm" {
  version = "2.12.0"
  features {}
}

terraform {
  backend "azurerm" {}
}
