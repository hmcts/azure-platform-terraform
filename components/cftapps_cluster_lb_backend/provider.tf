provider "azurerm" {
  version = "=1.31.0"
}

provider "local" {
  version = "=1.3.0"
}
terraform {
  backend "azurerm" {}
}
