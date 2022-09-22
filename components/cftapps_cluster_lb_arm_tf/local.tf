locals {
  vnet_rg   = var.env == "prod" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "prod" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"
}
