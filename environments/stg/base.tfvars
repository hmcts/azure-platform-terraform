env       = "aat"
project   = "hmcts"
component = "lz"
ddosplan  = "basic"

aks = [
  {
    vnet_name = "core-aat-vnet",
    rg_name   = "aks-infra-aat-rg"
    rt_name   = "aks-route-table"
  },
]

firewall = [
  {
    hub_vnet       = "10.107.0.0/24"
    priority       = "200"
    location       = "uksouth"
    aks_dnat_rules = ["10.10.19.250", "10.10.23.250"]
  }
]