locals {
  vnet_rg                  = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "prod" || var.env == "demo" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name                = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "prod" || var.env == "demo" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"
  key_vault_name           = "acmedcdcftapps${var.subscription}"
  key_vault_resource_group = "cft-platform-${var.subscription}-rg"
}
