project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "sbox"
subscription = "sbox"
waf_mode  = "Detection"
enablessl = false
sslMode   = "AzureKeyVault"

frontends = [
  {
    name             = "plum"
    custom_domain    = "sandbox.platform.hmcts.net"
    backend_domain   = ["uksouth.sandbox.platform.hmcts.net"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules = {}
  },
]