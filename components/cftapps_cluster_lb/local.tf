locals {
  vnet_rg   = var.env == "sbox" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"
}
