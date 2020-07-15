project                    = "hmcts"
location                   = "uksouth"
env                        = "perftest"
subscription               = "test"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-test"

app_gw_private_ip_address = "10.10.46.121"
data_subscription         = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
oms_env                   = "nonprod"

shutter_storage = "TODO"
cdn_sku         = "TODO"
shutter_rg      = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

cft_apps_ag_ip_address = "10.10.46.123"
cft_apps_cluster_ips   = ["10.10.41.250", "10.10.45.250"]

frontends = [
  {
    name             = "sscs-tribunals"
    custom_domain    = "benefit-appeal.perftest.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth-token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "sscs-cor"
    mode             = "Detection"
    custom_domain    = "sscs-cor.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net",
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "cmc"
    mode             = "Detection"
    custom_domain    = "moneyclaims.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "cmc-legal"
    mode             = "Detection"
    custom_domain    = "moneyclaims-legal.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "www-ccd"
    mode             = "Detection"
    custom_domain    = "www-ccd.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "gateway-ccd"
    mode             = "Detection"
    custom_domain    = "gateway-ccd.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "return-case-doc-ccd"
    mode             = "Detection"
    custom_domain    = "return-case-doc-ccd.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "idam-web-public"
    mode             = "Detection"
    custom_domain    = "idam-web-public.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
    disabled_rules   = {}
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "label"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "referer"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "response_type"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "state"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
    ]
  },
  {
    name             = "probate"
    custom_domain    = "probate.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "pcq"
    custom_domain    = "pcq.perftest.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "paybubble"
    custom_domain    = "paybubble.perftest.platform.hmcts.net"
    mode             = "Prevention"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
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
    ]
  },
  {
    name             = "bar"
    custom_domain    = "bar.perftest.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "fees-register"
    custom_domain    = "fees-register.perftest.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "xui-approve-org"
    mode             = "Detection"
    custom_domain    = "administer-orgs.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "xui-manage-org"
    mode             = "Detection"
    custom_domain    = "manage-org.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "xui-register-org"
    mode             = "Detection"
    custom_domain    = "register-org.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name             = "xui-webapp"
    mode             = "Detection"
    custom_domain    = "manage-case.perftest.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-perftest.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-perftest-platform-hmcts-net"
  },
  {
    name                        = "idam-web-admin"
    custom_domain               = "idam-web-admin.perftest.platform.hmcts.net"
    backend_domain              = ["firewall-nonprodi-palo-perftest.ukwest.cloudapp.azure.com"]
    certificate_name            = "wildcard-perftest-platform-hmcts-net"
    appgw_cookie_based_affinity = "Enabled"
    custom_rules = [
      {
        name               = "IPMatchWhitelist"
        priority           = 1
        type               = "MatchRule"
        action             = "Block"
        match_variable     = "RemoteAddr"
        operator           = "IPMatch"
        negation_condition = true
        match_values = [
          "81.134.202.29/32",
          "51.145.6.230/32",
          "194.33.192.0/25",
          "194.33.196.0/25",
          "52.210.206.51/32",
          "62.25.109.201/32",
          "62.25.109.203/32"
        ]
      },
    ],
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.Session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "label"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "refresh_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
    ]
  },
]
