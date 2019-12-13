project                    = "hmcts"
component                  = "lz"
location                   = "uksouth"
env                        = "sbox"
subscription               = "sbox"
waf_mode                   = "Detection"
enable_ssl                 = true
ssl_mode                    = "AzureKeyVault"
certificate_key_vault_name = "cftapps-sbox"

shutter_storage     = "default"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-sbox-rg"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "plum.sandbox.platform.hmcts.net"
]

cft_apps_ag_ip_address = "10.10.7.124"
cft_apps_cluster_ips   = ["10.10.1.250", "10.10.3.250"]

frontends = [
  {
    name             = "plum"
    custom_domain    = "sandbox.platform.hmcts.net"
    backend_domain   = ["firewall-sbox-int-palo-sbox.uksouth.cloudapp.azure.com"]
    certificate_name = "STAR-sandbox-platform-hmcts-net"
    disabled_rules   = {}
  },
]
