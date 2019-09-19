project = "hmcts"
component = "frontdoor"
location = "uksouth"
env = "sandbox"
waf_mode = "Detection"

custom_domain_name = "platform.hmcts.net"

backend_domain = [
    "uksouth.platform.hmcts.net",
    "ukwest.platform.hmcts.net",
    ]

frontend_hosts = [
    "demo",
    ]

disabled_waf_rules = {
    PHP             = ["933160"],
    LFI             = ["930130"],
    RFI             = ["931130"],
    RCE             = ["932140","932100","932110","932115","932105","932150"],
    XSS             = ["941160","941330","941340","941100","941130","941140","941150","941200","941310","941320","941350"],
    SQLI            = ["942200","942260","942340","942370","942430","942440","942210","942450","942400","942150","942410","942330","942190","942310","942380","942240","942110","942250","942180","942390","942300","942230","942100","942120","942360"],
    }