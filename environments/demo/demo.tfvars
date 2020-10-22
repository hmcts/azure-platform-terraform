env                        = "demo"
subscription               = "demo"
certificate_key_vault_name = "cftapps-demo"
app_gw_private_ip_address  = "10.51.32.121"
cft_apps_cluster_ips       = ["10.51.15.220"]

data_subscription = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
oms_env           = "nonprod"

frontends = [
  {
    name                        = "bulkscan"
    custom_domain               = "bulkscan.demo.platform.hmcts.net"
    backend_domain              = ["firewall-prod-int-palo-bulkscandemo.uksouth.cloudapp.azure.com"]
    certificate_name            = "wildcard-demo-platform-hmcts-net"
    appgw_cookie_based_affinity = "Enabled"
    cache_enabled               = "false"
  },
  {
    name                        = "reformscan"
    custom_domain               = "reformscan.demo.platform.hmcts.net"
    backend_domain              = ["firewall-prod-int-palo-reformscandemo.uksouth.cloudapp.azure.com"]
    certificate_name            = "wildcard-demo-platform-hmcts-net"
    appgw_cookie_based_affinity = "Enabled"
    cache_enabled               = "false"
  },
]