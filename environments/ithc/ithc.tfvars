project                    = "hmcts"
location                   = "uksouth"
env                        = "ithc"
subscription               = "ithc"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-ithc"

app_gw_private_ip_address = ["10.10.40.121"]
data_subscription         = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
privatedns_subscription   = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env                   = "nonprod"

shutter_storage = "TODO"
cdn_sku         = "TODO"
shutter_rg      = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

cft_apps_ag_ip_address = "10.10.40.123"
cft_apps_cluster_ips   = ["10.10.37.250"]


frontends = [
  {
    name             = "div-dn"
    custom_domain    = "decree-nisi-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
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
    name             = "div-da"
    custom_domain    = "decree-absolute-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
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
    name             = "div-rfe"
    custom_domain    = "respond-divorce-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
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
    name             = "div-pfe"
    custom_domain    = "petitioner-frontend-aks.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
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
    name             = "idam-web-public"
    custom_domain    = "idam-web-public.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
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
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.SSOSession"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "session_state"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
    ]
  },
  {
    name             = "cmc"
    mode             = "Detection"
    custom_domain    = "moneyclaims.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "cmc-legal"
    mode             = "Detection"
    custom_domain    = "moneyclaims-legal.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "fact"
    mode             = "Detection"
    custom_domain    = "fact.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "fact-admin"
    mode             = "Detection"
    custom_domain    = "fact-admin.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "nfdiv"
    mode             = "Detection"
    custom_domain    = "nfdiv.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "nfdiv-apply"
    mode             = "Detection"
    custom_domain    = "nfdiv-apply-for-divorce.ithc.platform.hmcts.net"
    backend          = "nfdiv"
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "nfdiv-civil"
    mode             = "Detection"
    custom_domain    = "nfdiv-end-civil-partnership.ithc.platform.hmcts.net"
    backend          = "nfdiv"
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "www-ccd"
    mode             = "Detection"
    custom_domain    = "www-ccd.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "gateway-ccd"
    mode             = "Detection"
    custom_domain    = "gateway-ccd.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "return-case-doc-ccd"
    mode             = "Detection"
    custom_domain    = "return-case-doc-ccd.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-approve-org"
    mode             = "Detection"
    custom_domain    = "administer-orgs.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-manage-org"
    mode             = "Detection"
    custom_domain    = "manage-org.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-register-org"
    mode             = "Detection"
    custom_domain    = "register-org.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "xui-webapp"
    mode             = "Detection"
    custom_domain    = "manage-case.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "ia-aip"
    mode             = "Detection"
    custom_domain    = "immigration-appeal.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "probate"
    mode             = "Prevention"
    custom_domain    = "probate.ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
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
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__eligibility"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "x-csrf-token"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "content-type"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "isUploadingDocument"
      },
    ]
  },
  {
    name             = "pcq"
    custom_domain    = "pcq.ithc.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "paybubble"
    custom_domain    = "paybubble.ithc.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "bar"
    custom_domain    = "bar.ithc.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name             = "fees-register"
    custom_domain    = "fees-register.ithc.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    name                        = "idam-web-admin"
    custom_domain               = "idam-web-admin.ithc.platform.hmcts.net"
    backend_domain              = ["firewall-nonprodi-palo-ithc.uksouth.cloudapp.azure.com"]
    certificate_name            = "wildcard-ithc-platform-hmcts-net"
    appgw_cookie_based_affinity = "Enabled"
    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "81.134.202.29/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
              "194.33.192.0/25",
              "194.33.196.0/25",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "51.140.8.67/32"
            ]
          }
        ]
      },
    ],
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "activationRedirectUrl"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "activationRedirectUrl"
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
        selector       = "oauth2ClientId"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2ClientSecret"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "oauth2RedirectUris"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "oauth2RedirectUris"
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
