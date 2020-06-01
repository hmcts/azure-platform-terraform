project                    = "hmcts"
location                   = "uksouth"
env                        = "aat"
subscription               = "stg"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-stg"

app_gw_private_ip_address = "10.10.24.121"

shutter_storage = "TODO"
cdn_sku         = "TODO"
shutter_rg      = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

cft_apps_ag_ip_address = "10.10.24.123"
cft_apps_cluster_ips   = ["10.10.19.250", "10.10.23.250"]

frontends = [
  {
    name             = "div-dn"
    custom_domain    = "decree-nisi-aks.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
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
    name             = "div-da"
    custom_domain    = "decree-absolute-aks.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
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
    custom_domain    = "respond-divorce-aks.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
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
    custom_domain    = "petitioner-frontend-aks.aat.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
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
    name             = "pet-app1"
    custom_domain    = "pet-app1.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "pet-app2"
    custom_domain    = "pet-app2.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-pet-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "sscs-tribunals"
    custom_domain    = "benefit-appeal.aat.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
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
    custom_domain    = "sscs-cor.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net",
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
    name             = "sscs-tya"
    mode             = "Detection"
    custom_domain    = "track-appeal.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "xui-webapp"
    mode             = "Detection"
    custom_domain    = "manage-case.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "xui-manage-org"
    mode             = "Detection"
    custom_domain    = "manage-org.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "xui-approve-org"
    mode             = "Detection"
    custom_domain    = "administer-orgs.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "xui-register-org"
    mode             = "Detection"
    custom_domain    = "register-org.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "cmc"
    mode             = "Detection"
    custom_domain    = "moneyclaims.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "cmc-legal"
    mode             = "Detection"
    custom_domain    = "moneyclaims-legal.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "ia-aip"
    mode             = "Detection"
    custom_domain    = "immigration-appeal.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "www-ccd"
    mode             = "Detection"
    custom_domain    = "www-ccd.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "gateway-ccd"
    mode             = "Detection"
    custom_domain    = "gateway-ccd.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "return-case-doc-ccd"
    mode             = "Detection"
    custom_domain    = "return-case-doc-ccd.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "pcq"
    mode             = "Detection"
    custom_domain    = "pcq.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "adoption"
    custom_domain    = "adoption.aat.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "probate"
    custom_domain    = "probate.aat.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
    disabled_rules = {
      RCE = [
        "932115"
      ]
    }
  },
  {
    name             = "idam-web-public"
    custom_domain    = "idam-web-public.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
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
    name             = "idam-web-public-aat2"
    custom_domain    = "idam-web-public-aat2.aat.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
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
    name             = "paybubble"
    custom_domain    = "paybubble.aat.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "bar"
    custom_domain    = "bar.aat.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  },
  {
    name             = "fees-register"
    custom_domain    = "fees-register.aat.platform.hmcts.net"
    mode             = "Detection"
    backend_domain   = ["firewall-prod-int-palo-aat.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-aat-platform-hmcts-net"
  }
]
