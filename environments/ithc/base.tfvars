env                 = "ithc"
project             = "hmcts"
component           = "lz"
ddosplan            = "basic"

aks = [
  {
    vnet_name = "core-ithc-vnet",
    rg_name = "aks-infra-ithc-rg"
    rt_name = "aks-route-table"
  },
]

firewall = [
  {
    hub_vnet       = "10.103.0.0/24"
    priority       = "200"
    location       = "uksouth"
    aks_dnat_rules = [ "10.10.33.250", "10.10.35.250"]
  }
]