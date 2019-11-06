project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "sbox"
subscription = "sbox"
waf_mode  = "Detection"
enable_ssl = true
sslMode   = "AzureKeyVault"
certificate_key_vault_name = "cftapps-sbox"

frontends = [
  {
    name             = "plum"
    custom_domain    = "sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules = {}
  },
]