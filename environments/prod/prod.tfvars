project                = "hmcts"
location               = "uksouth"
env                    = "prod"
subscription           = "prod"
ssl_mode               = "FrontDoor"
certificate_name_check = false

app_gw_private_ip_address           = ["10.13.32.120", "10.13.32.110"]
app_gw_private_ip_address_arm_to_tf = ["10.90.96.120", "10.90.96.110"]
data_subscription                   = "8999dec3-0104-4a27-94ee-6588559729d1"
privatedns_subscription             = "1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
oms_env                             = "prod"

cdn_sku    = "Standard_Verizon"
shutter_rg = "shutter-app-prod-rg"

cft_apps_ag_ip_address           = "10.13.32.122"
cft_apps_ag_ip_address_arm_to_tf = "10.90.96.122"
cft_apps_cluster_ips             = ["10.13.15.250", "10.13.31.250"]
cft_apps_cluster_ips_arm_to_tf   = ["10.90.79.250", "10.90.95.250"]

hub           = "prod"
apim_sku_name = "Premium"

frontends = [
  {
    name             = "plum"
    product          = "cnp"
    custom_domain    = "plum.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
  },
  {
    product          = "div"
    name             = "div-dn"
    mode             = "Prevention"
    custom_domain    = "www.decree-nisi.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
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
    product          = "div"
    name             = "div-da"
    mode             = "Prevention"
    custom_domain    = "www.decree-absolute.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
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
    product          = "div"
    name             = "div-rfe"
    mode             = "Prevention"
    custom_domain    = "www.respond-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
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
    product          = "div"
    name             = "div-pfe"
    mode             = "Detection"
    custom_domain    = "www.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
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
    product          = "div"
    name             = "div-amend"
    mode             = "Detection"
    custom_domain    = "www.manage-application.apply-divorce.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-application-apply-divorce-service-gov-uk"
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
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cookies_policy"
      },
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
    product          = "nfdiv"
    name             = "nfdiv-civil-partnership"
    mode             = "Detection"
    custom_domain    = "www.end-civil-partnership.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "end-civil-partnership-service-gov-uk"
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
    },
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
              "51.145.34.88/32",
              "81.134.202.29/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "nfdiv-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "nfdiv-session"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "lng"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "client_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "applicant1UploadedFiles"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "applicant2UploadedFiles"
      },
    ]
  },
  {
    product          = "sscs"
    name             = "sscs-tribunals"
    mode             = "Prevention"
    custom_domain    = "www.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
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
        selector       = "cookies_policy"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      }
    ]
  },
  {
    product          = "sscs"
    name             = "sscs-tya"
    mode             = "Prevention"
    custom_domain    = "www.track-benefit-appeal.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
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
    product          = "sscs"
    name             = "sscs-cor"
    mode             = "Prevention"
    custom_domain    = "www.manage.appeal-benefit-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "www-manage-appeal-benefit-decision-service-gov-uk"
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
        selector       = "cookies_policy"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      }
    ]
  },
  {
    product          = "xui"
    name             = "xui-webapp"
    mode             = "Detection"
    custom_domain    = "manage-case.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-case-platform-hmcts-net"
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
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth__"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "xui-webapp"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ],
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            transforms = [
              "Uppercase"
            ]
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ]
  },
  {
    product          = "xui"
    name             = "xui-manage-org"
    mode             = "Detection"
    custom_domain    = "manage-org.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth__"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "xui-manage-org"
      },
    ],
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            transforms = [
              "Uppercase"
            ]
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ]
  },
  {
    product          = "xui"
    name             = "xui-approve-org"
    mode             = "Detection"
    custom_domain    = "administer-orgs.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth__"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "xui-approve-org"
      },
    ]
  },
  {
    product          = "xui"
    name             = "xui-register-org"
    mode             = "Detection"
    custom_domain    = "register-org.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "iss"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "__auth__"
      },
    ]
  },
  {
    product          = "cmc"
    name             = "cmc"
    mode             = "Prevention"
    custom_domain    = "www.moneyclaims.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
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
    product          = "cmc"
    name             = "cmc-legal"
    mode             = "Prevention"
    custom_domain    = "www.moneyclaim-legal.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        selector       = "dtSa"
      },
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
    product          = "ccd"
    name             = "gateway-ccd"
    mode             = "Prevention"
    custom_domain    = "gateway.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
        "942370",
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
        selector       = "__auth__"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_csrf"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_sm_au"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "_sm_au_c"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ai_session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ai_user"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "accessToken"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "BNES_dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "XSRF-TOKEN"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "roles"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ssm_au"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "ssm_au_c"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "xui-webapp"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.appeal.appellant.identity.nino"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.appealReferenceNumber"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.caseReference"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.D8caseReference"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.deceasedSurname"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.divorceCaseNumber"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.deceasedForenames"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.D8PetitionerEmail"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.ethosCaseReference"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.familyManCaseNumber"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "case.previousServiceCaseReference"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "code"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "postcode"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    product          = "ccd"
    name             = "return-case-doc-ccd"
    mode             = "Detection"
    custom_domain    = "return-case-doc.ccd.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "ccd-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
      }
    ]
  },
  {
    product          = "probate"
    name             = "probate"
    mode             = "Prevention"
    custom_domain    = "www.apply-for-probate.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "apply-for-probate-service-gov-uk"
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            transforms = [
              "Uppercase"
            ]
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ],
    disabled_rules = {
      RCE = [
        "932115"
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
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "cm-user-preferences"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "addressLine1"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "addressLine2"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "addressLine3"
      },
    ]
  },
  {
    product          = "ia"
    name             = "ia-aip"
    mode             = "Detection"
    custom_domain    = "www.appeal-immigration-asylum-decision.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "appeal-immigration-asylum-decision-service-gov-uk"
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
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
        selector       = "__auth-token"
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
        selector       = "cookies_policy"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      },
    ]
  },
  {
    product          = "fees"
    name             = "fees-register"
    mode             = "Prevention"
    custom_domain    = "fees-register.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "fees-register-platform-hmcts-net"
    www_redirect     = true
    custom_rules = [
      {
        name     = "IPMatchWhitelist"
        priority = 1
        type     = "MatchRule"
        action   = "Block"
        match_conditions = [
          {
            match_variable     = "RequestUri"
            operator           = "EndsWith"
            negation_condition = false
            match_values = [
              "/fees"
            ]
          },
          {
            match_variable     = "RemoteAddr"
            operator           = "IPMatch"
            negation_condition = true
            match_values = [
              "81.134.202.29/32",
              "51.145.6.230/32",
              "194.33.192.0/25",
              "194.33.193.0/25",
              "194.33.196.0/25",
              "194.33.197.0/25",
              "52.210.206.51/32",
              "62.25.109.201/32",
              "62.25.109.203/32",
              "51.143.139.240/32",
              "51.145.4.100/32"
            ]
          }
        ]
      },
    ],
    global_exclusions = [
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
        selector       = "__redirect"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "fee-register-admin-web-cookie-preferences"
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
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "QueryParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "DecodedPath"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "PostParamName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "expression"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "GroupName"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "NFuse_Application"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "banner_id"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "callback"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "reply_message_template"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "name"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "User-Agent"
      },
      {
        match_variable = "RequestHeaderNames"
        operator       = "Equals"
        selector       = "content-type"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "csvFees"
      },
      {
        match_variable = "RequestBodyPostArgNames"
        operator       = "Equals"
        selector       = "description"
      },
    ]
  },
  {
    product          = "fees"
    name             = "paybubble"
    mode             = "Prevention"
    custom_domain    = "paybubble.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "paybubble-platform-hmcts-net"
    www_redirect     = true
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
    product          = "fees"
    name             = "manage-payments"
    mode             = "Detection"
    custom_domain    = "manage-payments.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "manage-payments-platform-hmcts-net"
    www_redirect     = true
  },
  {
    product          = "fees"
    name             = "payment-outcome"
    mode             = "Detection"
    custom_domain    = "paymentoutcome-web.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "paymentoutcome-web-platform-hmcts-net"
    www_redirect     = true
  },
  {
    product          = "idam"
    name             = "idam-web-public"
    custom_domain    = "hmcts-access.service.gov.uk"
    ssl_mode         = "AzureKeyVault"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "hmcts-access-service-gov-uk"
    cache_enabled    = "false"
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
        selector       = "rf"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "post_logout_redirect_uri"
      },
    ]
  },
  {
    product          = "pcq"
    name             = "pcq"
    mode             = "Prevention"
    custom_domain    = "equality-and-diversity.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
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
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "pcq-cookie-preferences"
      },
      // Google Analytics Exclusions
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
      // Dynatrace Exclusions
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtSa"
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
      }
    ],
    custom_rules = [
      {
        name     = "RumBeaconExclusion"
        priority = 100
        type     = "MatchRule"
        action   = "Allow"
        match_conditions = [
          {
            match_variable     = "RequestMethod"
            operator           = "Equal"
            negation_condition = false
            transforms = [
              "Uppercase"
            ]
            match_values = [
              "POST"
            ]
          },
          {
            match_variable     = "RequestUri"
            operator           = "Contains"
            negation_condition = false
            match_values = [
              "/rb_"
            ]
          }
        ]
      },
    ]
  },
  {
    product          = "lau"
    name             = "lau"
    mode             = "Detection"
    custom_domain    = "log-and-audit.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "log-and-audit-platform-hmcts-net"
    global_exclusions = [
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "connect.sid"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "dtCookie"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "lau-cookie-preferences"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "lau-session"
      },
    ]
  },
  {
    product          = "cft-api-mgmt"
    name             = "cft-api-mgmt"
    custom_domain    = "cft-api-mgmt.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cftapimgmtprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product          = "fact"
    name             = "fact"
    mode             = "Detection"
    custom_domain    = "www.find-court-tribunal.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "find-court-tribunal-service-gov-uk"
  },
  {
    product          = "fact"
    name             = "fact-admin"
    mode             = "Detection"
    custom_domain    = "admin.find-court-tribunal.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "find-court-tribunal-service-gov-uk"
  },
  {
    product          = "fact-redirect"
    name             = "fact-redirect"
    mode             = "Detection"
    custom_domain    = "courttribunalfinder.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    ssl_mode         = "AzureKeyVault"
    certificate_name = "courttribunalfinder-service-gov-uk"
  },
  {
    product          = "jui"
    name             = "jui-redirect"
    mode             = "Detection"
    custom_domain    = "jcm.judiciary.uk"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "jcm-judiciary-uk"
    ssl_mode         = "AzureKeyVault"
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
    product                     = "idam"
    name                        = "idam-web-admin"
    custom_domain               = "idam-web-admin.platform.hmcts.net"
    backend_domain              = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name            = "idam-web-admin-platform-hmcts-net"
    appgw_cookie_based_affinity = "Enabled"
    cache_enabled               = "false"
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
              "51.145.34.88/32",
              "81.134.202.29/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
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
    product          = "idam"
    name             = "idam-user-dashboard"
    custom_domain    = "idam-user-dashboard.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "idam-user-dashboard-platform-hmcts-net"
    cache_enabled    = "false"
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
              "51.145.34.88/32",
              "81.134.202.29/32",
              "51.145.6.230/32",
              "51.145.4.100/32",
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
      }
    ]
  },
  {
    product          = "hmi"
    name             = "hmi-apim"
    custom_domain    = "hmi-apim.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-hmiapimprod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-platform-hmcts-net"
    cache_enabled    = "false"
  },
  {
    product             = "reform-scan"
    name                = "reformscan"
    custom_domain       = "reformscan.platform.hmcts.net"
    host_header         = "reformscanprod.blob.core.windows.net"
    mode                = "Detection"
    backend_domain      = ["firewall-prod-int-palo-reformscanprod.uksouth.cloudapp.azure.com"]
    certificate_name    = "wildcard-platform-hmcts-net"
    forwarding_protocol = "MatchRequest"
    health_path         = "/"
    health_protocol     = "Https"
    cache_enabled       = "false"
  },
  {
    product          = "adoption"
    name             = "adoption"
    mode             = "Detection"
    custom_domain    = "apply-for-adoption.platform.hmcts.net"
    backend_domain   = ["firewall-prod-int-palo-cft-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "apply-for-adoption-platform-hmcts-net"
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
      {
        match_variable = "RequestCookieNames"
        operator       = "Equals"
        selector       = "session"
      },
      {
        match_variable = "RequestCookieNames"
        operator       = "StartsWith"
        selector       = "__auth-token"
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
        selector       = "cookies_policy"
      },
      {
        match_variable = "QueryStringArgNames"
        operator       = "Equals"
        selector       = "rf"
      }
    ]
  },
  {
    product          = "et"
    name             = "et-sya"
    mode             = "Detection"
    custom_domain    = "www.claim-employment-tribunals.service.gov.uk"
    backend_domain   = ["firewall-prod-int-palo-prod.uksouth.cloudapp.azure.com"]
    certificate_name = "wildcard-claim-employment-tribunals-service-gov-uk"
  },
]
