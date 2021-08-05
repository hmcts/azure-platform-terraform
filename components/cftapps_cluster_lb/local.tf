locals {
  vnet_rg   = var.env == "sbox" || var.env == "perftest" || var.env == "aat" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" || var.env == "perftest" || var.env == "aat" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"
}