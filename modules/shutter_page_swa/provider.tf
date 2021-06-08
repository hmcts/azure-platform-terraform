terraform {
  required_version = ">= 0.15"

  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "2.58.0"
      configuration_aliases = [azurerm.dns]
    }
  }
}
