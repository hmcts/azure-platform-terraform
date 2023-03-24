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
    backend_domain   = ["firewall-nonprodi-palo-hmiapimdemo.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-demo-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name           = "div-dn"
    custom_domain  = "decree-nisi-aks.demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-da"
    custom_domain  = "decree-absolute-aks.demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-rfe"
    custom_domain  = "respond-divorce-aks.demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name           = "div-pfe"
    custom_domain  = "petitioner-frontend-aks.demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "reasonForDivorceBehaviourDetails"
      },
    ]
  },
  {
    name           = "fact"
    mode           = "Prevention"
    custom_domain  = "fact.demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtLatC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtPC"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "i18next"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fact-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_oauth2_proxy"
      }
    ]
  },
  {
    name           = "fact-admin"
    mode           = "Detection"
    custom_domain  = "fact-admin.demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "et-sya"
    mode           = "Detection"
    custom_domain  = "et-sya.demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "paybubble"
    custom_domain  = "paybubble.demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__user-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__pcipal-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ccpay-bubble-cookie-preferences"
      },
    ]
  },
  {
    name           = "paybubble-int"
    custom_domain  = "paybubble-int.demo.platform.hmcts.net"
    mode           = "Prevention"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__user-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedUrl"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__pcipal-info"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ccpay-bubble-cookie-preferences"
      },
    ]
  },
  {
    name           = "paymentoutcome-web"
    mode           = "Detection"
    custom_domain  = "paymentoutcome-web.demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    www_redirect   = true
  },
  {
    name           = "paymentoutcome-web-int"
    mode           = "Detection"
    custom_domain  = "paymentoutcome-web-int.demo.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftdemoappgateway.uksouth.cloudapp.azure.com"]
    www_redirect   = true
  }
]
