project                    = "hmcts"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

cdn_sku    = "Standard_Verizon"
shutter_rg = "shutter-app-prod-rg"

cft_apps_ag_ip_address = "10.13.32.122"
cft_apps_cluster_ips   = ["10.13.15.250", "10.13.31.250"]

frontends = [
  {
    name             = "div-dn"
    mode             = "Detection"
    custom_domain    = "www.decree-nisi.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-nisi-apply-divorce-service-gov-uk"
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
    mode             = "Detection"
    custom_domain    = "www.decree-absolute.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-absolute-apply-divorce-service-gov-uk"
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
    mode             = "Detection"
    custom_domain    = "www.respond-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "respond-divorce-service-gov-uk"
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
    mode             = "Detection"
    custom_domain    = "www.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "apply-divorce-service-gov-uk"
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
    ]
  },
  {
    name             = "sscs-tribunals"
    mode             = "Detection"
    custom_domain    = "www.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-appeal-benefit-decision-service-gov-uk"
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
    name             = "sscs-tya"
    mode             = "Detection"
    custom_domain    = "www.track-benefit-appeal.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-track-benefit-appeal-service-gov-uk"
  },
  {
    name             = "sscs-cor"
    mode             = "Detection"
    custom_domain    = "www.manage.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-appeal-benefit-decision-service-gov-uk"
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
    name             = "xui-webapp"
    mode             = "Detection"
    custom_domain    = "manage-case.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-case-platform-hmcts-net"
  },
  {
    name             = "xui-manage-org"
    mode             = "Detection"
    custom_domain    = "manage-org.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-org-platform-hmcts-net"
  },
  {
    name             = "xui-approve-org"
    mode             = "Detection"
    custom_domain    = "administer-orgs.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "administer-orgs-platform-hmcts-net"
  },
  {
    name             = "xui-register-org"
    mode             = "Detection"
    custom_domain    = "register-org.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "register-org-platform-hmcts-net"
  },
  {
    name             = "cmc"
    mode             = "Detection"
    custom_domain    = "www.moneyclaims.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "moneyclaims-service-gov-uk"
  },
  {
    name             = "cmc-legal"
    mode             = "Detection"
    custom_domain    = "www.moneyclaim-legal.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-moneyclaim-legal-platform-hmcts-net"
  },
  {
    name             = "www-ccd"
    mode             = "Detection"
    custom_domain    = "www.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "ccd-platform-hmcts-net"
  },
  {
    name             = "gateway-ccd"
    mode             = "Detection"
    custom_domain    = "gateway.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "ccd-platform-hmcts-net"
  },
  {
    name             = "return-case-doc-ccd"
    mode             = "Detection"
    custom_domain    = "return-case-doc.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "ccd-platform-hmcts-net"
  },
]
