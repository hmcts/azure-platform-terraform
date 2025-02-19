locals {
  vnet_rg                  = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "prod" || var.env == "demo" ? "cft-${var.env}-network-rg" : "aks-infra-${var.env}-rg"
  vnet_name                = var.env == "sbox" || var.env == "perftest" || var.env == "aat" || var.env == "ithc" || var.env == "prod" || var.env == "demo" ? "cft-${var.env}-vnet" : "core-${var.env}-vnet"
  key_vault_name           = "acmedcdcftapps${var.subscription}"
  key_vault_resource_group = "cft-platform-${var.subscription}-rg"
  hub_env                  = (var.env == "demo" || var.env == "ithc" || var.env == "perftest") ? "nonprod" : (var.env == "aat") ? "prod" : var.env

  hub = {
    nonprod = {
      subscription = "fb084706-583f-4c9a-bdab-949aac66ba5c"
    }
    prod = {
      subscription = "0978315c-75fe-4ada-9d11-1eb5e0e0b214"
    }
  }
}
