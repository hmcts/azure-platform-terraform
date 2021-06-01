locals {
  vnet_rg   = var.env == "sbox" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name = var.env == "sbox" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"

  potential_kv_rg = var.env == "perftest" || var.env == "aat" || var.env == "preview" ? "core-infra-${var.subscription}-rg" : "core-infra-${var.env}-rg"
  key_vault_resource_group = var.env == "sbox" ? "cft-platform-${var.env}-rg" : local.potential_kv_rg
}
