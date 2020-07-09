project                    = "hmcts"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
enable_ssl                 = true
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

app_gw_private_ip_address = "10.13.32.120"

cdn_sku    = "Standard_Verizon"
shutter_rg = "shutter-app-prod-rg"

cft_apps_ag_ip_address = "10.13.32.122"
cft_apps_cluster_ips   = ["10.13.15.250", "10.13.31.250"]

frontends = [
  {
    name             = "div-dn"
    mode             = "Prevention"
    custom_domain    = "www.decree-nisi.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-nisi-apply-divorce-service-gov-uk"
    disabled_rules = {
      SQLI = [
        "942100",
        "942150",
        "942200",
        "942210",
        "942230",
        "942310",
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
    ]
  },
  {
    name             = "div-da"
    mode             = "Prevention"
    custom_domain    = "www.decree-absolute.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "decree-absolute-apply-divorce-service-gov-uk"
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
    }
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
    ]
  },
  {
    name             = "div-rfe"
    mode             = "Prevention"
    custom_domain    = "www.respond-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "respond-divorce-service-gov-uk"
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
    }
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
    ]
  },
  {
    name             = "div-pfe"
    mode             = "Prevention"
    custom_domain    = "www.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "apply-divorce-service-gov-uk"
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
        "942430",
      ]
      LFI = [
        "930100", // false positive on multi-part uploads
        "930110", // false positive on multi-part uploads
      ]
      RCE = [
        "932100"
      ]
    }
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
        selector       = "reasonForDivorceBehaviourDetails" // free text field that gets pinged a lot for sql like characters
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "file" // prevent WebKitFormBoundary path traversal FPs
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "fileUrl" // this is used as a HAL ID for the document, it's a URI and a URL
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "legalProceedingsDetails"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "petitionerNameChangedHowOtherDetails"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "address"
      },
    ]
  },
  {
    name             = "sscs-tribunals"
    mode             = "Prevention"
    custom_domain    = "www.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-appeal-benefit-decision-service-gov-uk"
    disabled_rules = {
      SQLI = [
        "942100",
        "942150",
        "942200",
        "942210",
        "942230",
        "942310",
        "942340",
        "942360",
        "942361",
        "942380",
        "942400",
        "942430"
      ]
      LFI = [
        "930100", // false positive on multi-part uploads
        "930110", // false positive on multi-part uploads
      ]
      RCE = [
        "932100"
      ]
    }
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
        match_variable = "RequestBodyPostArgNames"
        operator       = "Contains"
        selector       = "whatYouDisagreeWith"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Contains"
        selector       = "reasonForAppealing"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "otherReasonForAppealing"
      },
    ]
  },
  {
    name             = "sscs-tya"
    mode             = "Prevention"
    custom_domain    = "www.track-benefit-appeal.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-track-benefit-appeal-service-gov-uk"
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
        "942440",
      ]
    }
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
        selector       = "tya-surname-appeal-validated"
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
    mode             = "Prevention"
    custom_domain    = "www.manage.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-appeal-benefit-decision-service-gov-uk"
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
    certificate_name = "manage-case"
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
    }
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "xui-manage-org"
    mode             = "Detection"
    custom_domain    = "manage-org.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-org-platform-hmcts-net"
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
    }
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "xui-approve-org"
    mode             = "Detection"
    custom_domain    = "administer-orgs.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "administer-orgs-platform-hmcts-net"
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
    }
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "xui-register-org"
    mode             = "Detection"
    custom_domain    = "register-org.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "register-org-platform-hmcts-net"
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
    }
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "cmc"
    mode             = "Prevention"
    custom_domain    = "www.moneyclaims.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "moneyclaims-service-gov-uk"
    disabled_rules = {
      SQLI = [
        "942100",
        "942110",
        "942150",
        "942200",
        "942210",
        "942230",
        "942260",
        "942300",
        "942310",
        "942330",
        "942340",
        "942361",
        "942370",
        "942380",
        "942390",
        "942400",
        "942410",
        "942430",
        "942450",
      ]
      RCE = [
        "932105",
        "932115",
        "932150",
      ]
      PROTOCOL-ATTACK = [
        "921110"
      ]
    }
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "SESSION_ID"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
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
        selector       = "signerRole"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reason"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "StartsWith"
        selector       = "rows"
      },
    ]

  },
  {
    name             = "cmc-legal"
    mode             = "Prevention"
    custom_domain    = "www.moneyclaim-legal.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-moneyclaim-legal-platform-hmcts-net"
    disabled_rules = {
      SQLI = [
        "942100",
        "942150",
        "942200",
        "942210",
        "942230",
        "942260",
        "942361",
        "942380",
        "942400",
        "942430",
      ]
    }
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "T2_SESSION_ID"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
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
        selector       = "text"
      },
    ]

  },
  {
    name             = "www-ccd"
    mode             = "Prevention"
    custom_domain    = "www.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "ccd-platform-hmcts-net"
    disabled_rules = {
      SQLI = [
        "942440",
      ]
    }
    global_exclusions = [
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
    ]
  },
  {
    name             = "gateway-ccd"
    mode             = "Prevention"
    custom_domain    = "gateway.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "ccd-platform-hmcts-net"
    disabled_rules = {
      SQLI = [
        "942100",
        "942110",
        "942150",
        "942200",
        "942210",
        "942230",
        "942361",
        "942380",
        "942400",
        "942440",
      ]
      LFI = [
        "930100", // false positive on multi-part uploads
        "930110", // false positive on multi-part uploads
      ]
      RCE = [
        "932105",
        "932150",
      ]
    }
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "accessToken"
      },
    ]
  },
  {
    name             = "return-case-doc-ccd"
    mode             = "Detection"
    custom_domain    = "return-case-doc.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "ccd-platform-hmcts-net"
  },
  {
    name             = "probate"
    mode             = "Prevention"
    custom_domain    = "www.apply-for-probate.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "apply-for-probate-service-gov-uk"
    disabled_rules = {
      RCE = [
        "932115"
      ]
    }
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
    name             = "ia-aip"
    mode             = "Detection"
    custom_domain    = "immigration-appeal.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "immigration-appeal-platform-hmcts-net"
  },
  {
    name             = "fees-register"
    mode             = "Detection"
    custom_domain    = "fees-register.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "fees-register-platform-hmcts-net"
    www_redirect     = true
  },
  {
    name             = "paybubble"
    mode             = "Detection"
    custom_domain    = "paybubble.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "paybubble-platform-hmcts-net"
    www_redirect     = true
  },
  {
    name             = "manage-payments"
    mode             = "Detection"
    custom_domain    = "manage-payments.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-payments-platform-hmcts-net"
    www_redirect     = true
  },
  {
    name             = "idam-web-public"
    custom_domain    = "hmcts-access.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "hmcts-access-service-gov-uk"
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
    name             = "pcq"
    mode             = "Prevention"
    custom_domain    = "equality-and-diversity.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "equality-and-diversity-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
    ]
  },
  {
    name             = "jui-redirect"
    mode             = "Detection"
    custom_domain    = "jcm.judiciary.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-case"
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
    }
  },
  {
    name             = "idam-web-admin"
    custom_domain    = "idam-web-admin.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "idam-web-admin-platform-hmcts-net"
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
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32"
            ]
          }
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
