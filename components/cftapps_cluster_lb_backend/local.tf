locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  vnet_rg   = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "demo" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "demo" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"

  key_vault_resource_group = var.env == "sbox" ? "enterprise-${var.subscription}-rg" : "cft-platform-${var.subscription}-rg"
}
