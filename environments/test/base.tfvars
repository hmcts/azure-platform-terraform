env                 = "perftest"
project             = "hmcts"
component           = "lz"
ddosplan            = "basic"

aks = [
  {
    vnet_name = "core-perftest-vnet",
    rg_name = "aks-infra-perftest-rg"
    rt_name = "aks-route-table"
  },
]

firewall = [
  {
    hub_vnet       = "10.105.0.0/24"
    priority       = "200"
    location       = "uksouth"
    aks_dnat_rules = [ "10.10.41.250", "10.10.45.250"]
  }
]