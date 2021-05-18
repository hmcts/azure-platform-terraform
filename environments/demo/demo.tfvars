env                        = "demo"
subscription               = "demo"
certificate_key_vault_name = "cftapps-demo"
app_gw_private_ip_address  = ["10.51.32.121"]
cft_apps_cluster_ips       = ["10.51.15.220"]
certificate_name_check     = false

data_subscription = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
privatedns_subscription   = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env           = "nonprod"

frontends = [
  {
    name                = "reformscan"
    custom_domain       = "reformscan.demo.platform.hmcts.net"
    host_header         = "reformscandemo.blob.core.windows.net"
    mode                = "Detection"
    backend_domain      = ["firewall-nonprodi-palo-reformscandemo.uksouth.cloudapp.azure.com"]
    certificate_name    = "wildcard-demo-platform-hmcts-net"
    forwarding_protocol = "MatchRequest"
    health_path         = "/"
    health_protocol     = "Https"
    cache_enabled       = "false"
  },
  {
    name             = "ia-aip"
    mode             = "Detection"
    custom_domain    = "immigration-appeal.demo.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-demo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
]
