env                    = "demo"
subscription           = "demo"
cft_apps_cluster_ips   = ["10.50.79.221", "10.50.95.221"]
certificate_name_check = false

frontend_agw_private_ip_address = "10.50.97.122"
backend_agw_private_ip_address  = ["10.50.97.118", "10.50.97.119"]

data_subscription       = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
privatedns_subscription = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env                 = "nonprod"

hub = "nonprod"
# trigger precommit
frontends = [
  {
    name                = "reformscan"
    custom_domain       = "reformscan.demo.platform.hmcts.net"
    host_header         = "reformscandemo.blob.core.windows.net"
    mode                = "Detection"
    backend_domain      = ["firewall-nonprodi-palo-reformscandemo.uksouth.cloudapp.azure.com"]
    forwarding_protocol = "MatchRequest"
    health_path         = "/"
    health_protocol     = "Https"
    cache_enabled       = "false"
  },
  {
    product          = "cft-api-mgmt"
    name             = "cft-api-mgmt"
    custom_domain    = "cft-api-mgmt.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftapimgmtdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product          = "plum-public"
    name             = "plum-public"
    custom_domain    = "plum-public.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    product          = "plum"
    name             = "plum"
    custom_domain    = "plum.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
  },
  {
    product          = "dss-update-case"
    name             = "dss-update-case"
    custom_domain    = "dss-update-case.demo.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name             = "hmi-apim"
    custom_domain    = "hmi-apim.demo.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-hmiapimdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
  }
]
