terraform {
  required_version = "1.13.3"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.privatedns_subscription
}
