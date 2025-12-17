project      = "hmcts"
location     = "uksouth"
env          = "preview"
subscription = "dev"
ssl_policy = {
  policy_type          = "Predefined"
  policy_name          = "AppGwSslPolicy20220101S"
  min_protocol_version = "TLSv1_2"
}
ssl_certificate        = "wildcard-dev-platform-hmcts-net"
key_vault_subscription = "8b6ea922-0862-443e-af15-6056e1c9b9a4"

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
  },
  {
    name                   = "csds-active"
    custom_domain          = "csds.dev.apps.hmcts.net"
    dns_zone_name          = "dev.apps.hmcts.net"
    backend_domain         = ["firewall-nonprodi-palo-csds-dev.uksouth.cloudapp.azure.com"]
    disabled_rules         = {}
    disable_frontend_appgw = true
    host_header            = "csds-active.dev.platform.hmcts.net"
  },
  {
    name                   = "csds-passive"
    custom_domain          = "csds-dev.sandbox.apps.hmcts.net"
    dns_zone_name          = "dev.apps.hmcts.net"
    backend_domain         = ["firewall-nonprodi-palo-csds-dev.uksouth.cloudapp.azure.com"]
    disabled_rules         = {}
    disable_frontend_appgw = true
    host_header            = "csds-passive.dev.platform.hmcts.net"
  }
]
