terraform {
  required_version = ">= 0.13.0"

  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id            = var.privatedns_subscription
}
