terraform {
  required_version = ">= 0.13.0"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.58.0"
    }
  }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
