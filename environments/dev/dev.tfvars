project           = "hmcts"
location          = "uksouth"
env               = "preview"
subscription      = "dev"

data_subscription = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
oms_env           = "nonprod"
autoShutdown      = true
frontends = [
  {
    name           = "hmi-apim"
    custom_domain  = "hmi-apim.dev.platform.hmcts.net"
    dns_zone_name  = "dev.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-hmiapimdev.uksouth.cloudapp.azure.com"]
    cache_enabled  = "false"
  },
  {
    name                           = "reformscan"
    custom_domain                  = "reformscan.preview.platform.hmcts.net"
    dns_zone_name                  = "preview.platform.hmcts.net"
    backend_domain                 = ["firewall-prod-int-palo-reformscanpreview.uksouth.cloudapp.azure.com"]
    appgw_cookie_based_affinity    = "Enabled"
    cache_enabled                  = "false"
    certificate_name_check_enabled = false
  }
]
