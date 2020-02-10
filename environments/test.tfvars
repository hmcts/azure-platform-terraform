project                    = "hmcts"
location                   = "uksouth"
env                        = "perftest"
subscription               = "test"
enable_ssl                 = false
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-test"

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
]
