provider "azurerm" {
  version = "2.20.0"
  features {}
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {}
}
