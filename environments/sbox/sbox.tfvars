project                    = "hmcts"
location                   = "uksouth"
env                        = "sbox"
subscription               = "sbox"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-sbox"

app_gw_private_ip_address = "10.10.7.122"

cdn_sku    = "Standard_Verizon"
shutter_rg = "shutter-app-sbox-rg"

cft_apps_ag_ip_address = "10.10.7.124"
cft_apps_cluster_ips   = ["10.10.1.250", "10.10.3.250"]

frontends = [
  {
    name             = "plum"
    custom_domain    = "plum.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules   = {}
  },
  {
    name             = "idam-web-public"
    custom_domain    = "idam-web-public.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "QueryStringArgNames",
        operator       = "Equals",
        selector       = "redirectUri"
      },
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
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
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
    ]
  },
  {
    name             = "idam-sprod-web-public"
    custom_domain    = "idam-web-public-sprod.sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules   = {}
    global_exclusions = [
      {
        match_variable = "RequestBodyPostArgNames",
        operator       = "StartsWith",
        selector       = "password"
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
        operator       = "Equals",
        selector       = "description"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "redirect_uri"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "jwt"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "token"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "Idam.AuthId"
      },
    ]
  },
]