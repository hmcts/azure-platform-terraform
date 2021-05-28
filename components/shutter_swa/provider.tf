terraform {
  required_version = ">= 0.13.0"

  # backend "azurerm" {}
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

provider "azurerm" {
  features {}
  alias = "dns"
  subscription_id = "ed302caf-ec27-4c64-a05e-85731c3ce90e"
}
