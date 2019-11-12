project   = "hmcts"
component = "lz"
location  = "uksouth"
env       = "prod"
subscription = "prod"
waf_mode  = "Detection"
enable_ssl = false
sslMode   = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

frontends = []

frontends_with_palo = []