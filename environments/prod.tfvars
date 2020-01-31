project                    = "hmcts"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

shutter_storage     = "default"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-prod-rg"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
default_shutter = [
  {
    custom_domain    = "www.apply-divorce.service.gov.uk"
    certificate_name = "apply-divorce-service-gov-uk"
  },
  {
    custom_domain    = "www.respond-divorce.service.gov.uk"
    certificate_name = "respond-divorce-service-gov-uk"
  },
  {
    custom_domain    = "www.decree-absolute.apply-divorce.service.gov.uk"
    certificate_name = "decree-absolute-apply-divorce-service-gov-uk"
  },
  {
    custom_domain    = "www.decree-nisi.apply-divorce.service.gov.uk"
    certificate_name = "decree-nisi-apply-divorce-service-gov-uk"
  }
]

sscssya_shutter = [ 
  {
    custom_domain    = "www.appeal-benefit-decision.service.gov.uk"
    certificate_name = "www-appeal-benefit-decision-service-gov-uk"
  }
]
sscscor_shutter = [
  {
    custom_domain    = "www.manage.appeal-benefit-decision.service.gov.uk"
    certificate_name = "manage-appeal-benefit-decision-service-gov-uk"
  }
]
sscstya_shutter = [
  {
    custom_domain    = "www.track-benefit-appeal.service.gov.uk"
    certificate_name = "www-track-benefit-appeal-service-gov-uk"
  }
]


cft_apps_ag_ip_address = "10.13.32.122"
cft_apps_cluster_ips   = ["10.13.15.250", "10.13.31.250"]

frontends = [
  {
    name             = "div-dn"
    custom_domain    = "www.decree-nisi.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-nisi-apply-divorce-service-gov-uk"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "div-da"
    custom_domain    = "www.decree-absolute.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-absolute-apply-divorce-service-gov-uk"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "div-rfe"
    custom_domain    = "www.respond-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "respond-divorce-service-gov-uk"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "div-pfe"
    custom_domain    = "www.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "apply-divorce-service-gov-uk"
    disabled_rules = {
      RFI = ["931130"],
      LFI = ["930110"],
      SQLI = [
        "942440",
        "942450",
        "942200",
        "942430",
        "942110",
        "942210",
        "942310"
      ]
    }
  },
  {
    name             = "sscs-tribunals"
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
    custom_domain    = "www.track-benefit-appeal.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-track-benefit-appeal-service-gov-uk"
  },
  {
    name             = "sscs-cor"
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
]
