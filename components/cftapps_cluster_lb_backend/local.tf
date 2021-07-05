locals {
  env = (var.env == "aat") ? "stg" : "${(var.env == "perftest") ? "test" : "${var.env}"}"

  vnet_rg   = var.env == "sbox" || var.env == "perftest" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" || var.env == "perftest" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"

  key_vault_resource_group = "cft-platform-${var.subscription}-rg"
}
