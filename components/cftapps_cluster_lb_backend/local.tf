locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  vnet_rg   = var.env == "sbox" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"

  key_vault_resource_group = var.env == "sbox" ? "cft-platform-${var.env}-rg" : var.env == "perftest" || var.env == "aat" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
}