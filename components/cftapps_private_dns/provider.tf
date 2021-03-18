terraform {
  required_version = ">= 0.13.0"
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}


