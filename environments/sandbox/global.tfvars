project   = "hmcts"
component = "frontdoor"
location  = "uksouth"
env       = "sandbox"
waf_mode  = "Detection"
enablessl = false

frontends = [
  {
    name           = "plum"
    custom_domain  = "sandbox.platform.hmcts.net"
    backend_domain = ["service.core-compute-sandbox.internal"]
    disabled_rules = {}
  },
]