terraform {
  required_version = ">= 0.13.0"

  backend "azurerm" {
    resource_group_name  = "azure-control-prod-rg"
    storage_account_name = "c8cbc6f36739db5d00b27sa"
    container_name       = "subscription-tfstate"
    key                  = "UK South/cft-platform/azure-platform-terraform/prod/global/terraform.tfstate"
    subscription_id      = "04d27a32-7a07-48b3-95b8-3c8691e1a263"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.76.0"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
