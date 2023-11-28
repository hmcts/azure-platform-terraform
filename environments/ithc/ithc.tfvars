project      = "hmcts"
location     = "uksouth"
env          = "ithc"
subscription = "ithc"

backend_agw_private_ip_address = ["10.11.225.111", "10.11.225.115"]
data_subscription              = "1c4f0704-a29e-403d-b719-b90c34ef14c9"
privatedns_subscription        = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env                        = "nonprod"
autoShutdown                   = true
hub                            = "nonprod"

shutter_storage = "TODO"
cdn_sku         = "TODO"
shutter_rg      = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

frontend_agw_private_ip_address = "10.11.225.113"
cft_apps_cluster_ips            = ["10.11.207.250", "10.11.223.250"]

frontends = [
  {
    name           = "div-dn"
    custom_domain  = "decree-nisi-aks.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

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
    name           = "div-da"
    custom_domain  = "decree-absolute-aks.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

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
    name           = "div-rfe"
    custom_domain  = "respond-divorce-aks.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

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
    name           = "div-pfe"
    custom_domain  = "petitioner-frontend-aks.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

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
    name           = "idam-web-public"
    custom_domain  = "idam-web-public.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "scope"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gat"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
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
        selector       = "cookies_policy"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_preferences_set"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "seen_cookie_message"
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
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "username"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "email"
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
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "nonce"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "id_token_hint"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_challenge"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code_verifier"
      }
    ]
  },
  {
    product        = "idam"
    name           = "hmcts-access"
    mode           = "Detection"
    custom_domain  = "hmcts-access.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "civil-citizen-ui"
    mode           = "Detection"
    custom_domain  = "civil-citizen-ui.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "cmc"
    mode           = "Detection"
    custom_domain  = "moneyclaims.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "cmc-legal"
    mode           = "Detection"
    custom_domain  = "moneyclaims-legal.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "fact"
    mode           = "Prevention"
    custom_domain  = "fact.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

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
    custom_domain  = "fact-admin.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "rpts"
    mode           = "Prevention"
    custom_domain  = "rpts.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
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
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "51.140.8.67/32",
              "20.50.109.148/32",
              "20.50.108.242/32",
              "20.108.187.55/32",
              "20.58.23.145/32",
              "51.11.124.205/32",
              "51.11.124.216/32"
            ]
          }
        ]
      },
    ]
  },
  {
    name           = "nfdiv"
    mode           = "Detection"
    custom_domain  = "nfdiv.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "nfdiv-apply"
    mode           = "Detection"
    custom_domain  = "nfdiv-apply-for-divorce.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "nfdiv-civil"
    mode           = "Detection"
    custom_domain  = "nfdiv-end-civil-partnership.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "gateway-ccd"
    mode           = "Detection"
    custom_domain  = "gateway-ccd.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "return-case-doc-ccd"
    mode           = "Detection"
    custom_domain  = "return-case-doc-ccd.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-approve-org"
    mode           = "Detection"
    custom_domain  = "administer-orgs.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-manage-org"
    mode           = "Detection"
    custom_domain  = "manage-org.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-register-org"
    mode           = "Detection"
    custom_domain  = "register-org.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "xui-webapp"
    mode           = "Detection"
    custom_domain  = "manage-case.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "ia-aip"
    mode           = "Detection"
    custom_domain  = "immigration-appeal.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "probate"
    mode           = "Prevention"
    custom_domain  = "probate.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

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
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cm-user-preferences"
      },
    ]
  },
  {
    name           = "pcq"
    custom_domain  = "pcq.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "lau"
    mode           = "Detection"
    custom_domain  = "lau.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
  },
  {
    name           = "paybubble"
    custom_domain  = "paybubble.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "bar"
    custom_domain  = "bar.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name           = "fees-register"
    custom_domain  = "fees-register.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

  },
  {
    name                        = "idam-web-admin"
    custom_domain               = "idam-web-admin.ithc.platform.hmcts.net"
    dns_zone_name               = "ithc.platform.hmcts.net"
    backend_domain              = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
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
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "51.140.8.67/32",
              "20.50.109.148/32",
              "20.50.108.242/32",
              "51.11.124.205/32",
              "51.11.124.216/32",
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
  {
    name             = "idam-user-dashboard"
    custom_domain    = "idam-user-dashboard.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
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
              "51.149.249.0/27",
              "194.33.196.0/25",
              "51.149.249.32/27",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "51.140.8.67/32",
              "20.50.109.148/32",
              "20.50.108.242/32",
              "51.11.124.205/32",
              "51.11.124.216/32",
              "20.108.187.55/32",
              "20.58.23.145/32"
            ]
          }
        ]
      },
    ],
    global_exclusions = [
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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "idam-user-dashboard-session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "idam_user_dashboard_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "auth_verification"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
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
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "code"
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
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
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
        selector       = "rxVisitor"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "rxvt"
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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_csrf"
      }
    ]
  },
  {
    name           = "sscs-tribunals"
    custom_domain  = "benefit-appeal.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    mode           = "Detection"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

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
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reasonForNoMRN"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reasonForBeingLate"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "nino"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "signer"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "selection.signLanguage.language"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "selection.anythingElse.language"
      }
    ]
  },
  {
    name           = "sscs-cor"
    mode           = "Detection"
    custom_domain  = "sscs-cor.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]

    disabled_rules = {
      SQLI = [
        "942100",
        "942150",
        "942200",
        "942210",
        "942230",
        "942361",
        "942380",
        "942400",
      ]
      LFI = [
        "930100", // false positive on multi-part uploads
        "930110", // false positive on multi-part uploads
      ]
    }
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
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
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
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
        operator       = "Equals"
        selector       = "question-field"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "describeTheEvidence"
      }
    ]
  },
  {
    name             = "adoption-web"
    custom_domain    = "adoption-web.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    name             = "privatelaw"
    custom_domain    = "privatelaw.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
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
    custom_domain    = "hmi-apim.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-hmiapimithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product          = "cft-api-mgmt"
    name             = "cft-api-mgmt"
    custom_domain    = "cft-api-mgmt.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftapimgmtithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    name           = "paymentoutcome-web"
    mode           = "Detection"
    custom_domain  = "paymentoutcome-web.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    www_redirect   = true
  },
  {
    product          = "plum"
    name             = "plum"
    custom_domain    = "plum.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    product          = "et"
    name             = "et-sya"
    mode             = "Detection"
    custom_domain    = "et-sya.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
  },
  {
    product          = "sptribs-frontend"
    name             = "sptribs-frontend"
    custom_domain    = "sptribs-frontend.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    product          = "dss-update-case"
    name             = "dss-update-case"
    custom_domain    = "dss-update-case.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
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
    product          = "tax-tribunals-datacapture"
    name             = "tax-tribunals-datacapture"
    custom_domain    = "tax-tribunals-datacapture.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_tax-tribunals-datacapture_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utma"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmb"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmc"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_utmz"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_ga"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "authenticity_token"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "address_lookup_url"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "steps_closure_support_documents_form"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "steps_details_documents_upload_form"
      }
    ]
  },
  {
    product          = "et-pet-et1"
    name             = "et-pet-et1"
    mode             = "Prevention"
    custom_domain    = "et-pet-et1.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_app_session"
      },
    ]
    disabled_rules = {
      SQLI = [
        "942100",
        "942120",
        "942140",
        "942150",
        "942160",
        "942170",
        "942180",
        "942190",
        "942200",
        "942210",
        "942220",
        "942230",
        "942240",
        "942250",
        "942260",
        "942270",
        "942280",
        "942290",
        "942300",
        "942310",
        "942320",
        "942330",
        "942340",
        "942350",
        "942360",
        "942361",
        "942370",
        "942380",
        "942390",
        "942400",
        "942410",
        "942430",
        "942440",
        "942450",
        "942470",
        "942480",
      ]
      LFI = [
        "930100",
        "930110",
        "930120",
        "930130",
      ]
      RFI = [
        "931100",
        "931110",
        "931120",
        "931130",
      ]
      RCE = [
        "932100",
        "932105",
        "932110",
        "932115",
        "932120",
        "932130",
        "932140",
        "932150",
        "932160",
        "932170",
        "932171",
        "932180",
      ]
      PHP = [
        "933100",
        "933110",
        "933120",
        "933130",
        "933140",
        "933150",
        "933151",
        "933160",
        "933170",
        "933180",
      ]
      XSS = [
        "941100",
        "941101",
        "941110",
        "941120",
        "941130",
        "941140",
        "941150",
        "941160",
        "941170",
        "941180",
        "941190",
        "941200",
        "941210",
        "941220",
        "941230",
        "941240",
        "941250",
        "941260",
        "941270",
        "941280",
        "941290",
        "941300",
        "941310",
        "941320",
        "941330",
        "941340",
        "941350",
      ]
      FIX = [
        "943100",
        "943110",
        "943120",
      ]
      JAVA = [
        "944100",
        "944110",
        "944120",
        "944130",
        "944200",
        "944210",
        "944220",
        "944250",
      ]
      PROTOCOL-ATTACK = [
        "921110",
        "921120",
        "921130",
        "921140",
        "921150",
        "921160",
        "921151",
      ]
    }
  },
  {
    product          = "et-pet-et3"
    name             = "et-pet-et3"
    mode             = "Prevention"
    custom_domain    = "et-pet-et3.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookie_setting"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_et3_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
        selector       = "_ga"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "DSID"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_gid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "IDE"
      },
    ]
    disabled_rules = {
      SQLI = [
        "942100",
        "942120",
        "942140",
        "942150",
        "942160",
        "942170",
        "942180",
        "942190",
        "942200",
        "942210",
        "942220",
        "942230",
        "942240",
        "942250",
        "942260",
        "942270",
        "942280",
        "942290",
        "942300",
        "942310",
        "942320",
        "942330",
        "942340",
        "942350",
        "942360",
        "942361",
        "942370",
        "942380",
        "942390",
        "942400",
        "942410",
        "942430",
        "942440",
        "942450",
        "942470",
        "942480",
      ]
      LFI = [
        "930100",
        "930110",
        "930120",
        "930130",
      ]
      RFI = [
        "931100",
        "931110",
        "931120",
        "931130",
      ]
      RCE = [
        "932100",
        "932105",
        "932110",
        "932115",
        "932120",
        "932130",
        "932140",
        "932150",
        "932160",
        "932170",
        "932171",
        "932180",
      ]
      PHP = [
        "933100",
        "933110",
        "933120",
        "933130",
        "933140",
        "933150",
        "933151",
        "933160",
        "933170",
        "933180",
      ]
      XSS = [
        "941100",
        "941101",
        "941110",
        "941120",
        "941130",
        "941140",
        "941150",
        "941160",
        "941170",
        "941180",
        "941190",
        "941200",
        "941210",
        "941220",
        "941230",
        "941240",
        "941250",
        "941260",
        "941270",
        "941280",
        "941290",
        "941300",
        "941310",
        "941320",
        "941330",
        "941340",
        "941350",
      ]
      FIX = [
        "943100",
        "943110",
        "943120",
      ]
      JAVA = [
        "944100",
        "944110",
        "944120",
        "944130",
        "944200",
        "944210",
        "944220",
        "944250",
      ]
      PROTOCOL-ATTACK = [
        "921110",
        "921120",
        "921130",
        "921140",
        "921150",
        "921160",
        "921151",
      ]
    }
  },
  {
    product          = "et-pet-admin"
    name             = "et-pet-admin"
    mode             = "Prevention"
    custom_domain    = "et-pet-admin.ithc.platform.hmcts.net"
    dns_zone_name    = "ithc.platform.hmcts.net"
    backend_domain   = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-ithc-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_super_session"
      },
    ]
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
              "194.33.192.0/25",
              "194.33.196.0/25",
              "51.145.4.100/32",
              "157.203.176.139/32",
              "157.203.176.138/32",
              "157.203.176.140/32",
              "157.203.176.190/32",
              "157.203.176.191/32",
              "157.203.176.192/32",
              "51.149.249.32/27",
              "51.149.249.0/27",
              "20.108.187.55/32",
              "20.58.23.145/32",
              "37.200.119.11/32",
              "185.10.12.32/28",
              "176.65.68.112/28",
            ]
          }
        ]
      },
    ]
    disabled_rules = {
      SQLI = [
        "942100",
        "942120",
        "942140",
        "942150",
        "942160",
        "942170",
        "942180",
        "942190",
        "942200",
        "942210",
        "942220",
        "942230",
        "942240",
        "942250",
        "942260",
        "942270",
        "942280",
        "942290",
        "942300",
        "942310",
        "942320",
        "942330",
        "942340",
        "942350",
        "942360",
        "942361",
        "942370",
        "942380",
        "942390",
        "942400",
        "942410",
        "942430",
        "942440",
        "942450",
        "942470",
        "942480",
      ]
      LFI = [
        "930100",
        "930110",
        "930120",
        "930130",
      ]
      RFI = [
        "931100",
        "931110",
        "931120",
        "931130",
      ]
      RCE = [
        "932100",
        "932105",
        "932110",
        "932115",
        "932120",
        "932130",
        "932140",
        "932150",
        "932160",
        "932170",
        "932171",
        "932180",
      ]
      PHP = [
        "933100",
        "933110",
        "933120",
        "933130",
        "933140",
        "933150",
        "933151",
        "933160",
        "933170",
        "933180",
      ]
      XSS = [
        "941100",
        "941101",
        "941110",
        "941120",
        "941130",
        "941140",
        "941150",
        "941160",
        "941170",
        "941180",
        "941190",
        "941200",
        "941210",
        "941220",
        "941230",
        "941240",
        "941250",
        "941260",
        "941270",
        "941280",
        "941290",
        "941300",
        "941310",
        "941320",
        "941330",
        "941340",
        "941350",
      ]
      FIX = [
        "943100",
        "943110",
        "943120",
      ]
      JAVA = [
        "944100",
        "944110",
        "944120",
        "944130",
        "944200",
        "944210",
        "944220",
        "944250",
      ]
      PROTOCOL-ATTACK = [
        "921110",
        "921120",
        "921130",
        "921140",
        "921150",
        "921160",
        "921151",
      ]
    }
  },
  {
    product        = "cui"
    name           = "cui-ra"
    mode           = "Prevention"
    custom_domain  = "cui-ra.ithc.platform.hmcts.net"
    dns_zone_name  = "ithc.platform.hmcts.net"
    backend_domain = ["firewall-nonprodi-palo-cftithc.uksouth.cloudapp.azure.com"],
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cui-session"
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
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  }
]

