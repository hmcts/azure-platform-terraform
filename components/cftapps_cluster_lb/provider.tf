provider "azurerm" {
  version = "1.42.0"
}

terraform {
  backend "azurerm" {}
}
