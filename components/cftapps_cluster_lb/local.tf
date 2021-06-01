locals {
  vnet_rg   = var.env == "sbox" ? "cft-${var.env}-vnet" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"

  key_vault_resource_group = var.env == "sbox" ? "genesis-rg" : var.env == "perftest" || var.env == "aat" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}