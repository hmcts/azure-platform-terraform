project                    = "hmcts"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
waf_mode                   = "Detection"
enable_ssl                 = false
ssl_mode                   = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

shutter_storage     = "TODO"
cdn_sku             = "TODO"
resource_group_name = "TODO"

# Applications associated with default storage account shutter static website.
# Teams that need a default shutter page should add their app frontend names to the list below.
shutter_apps = [
  "TODO"
]

cft_apps_ag_ip_address = "10.13.32.122"
cft_apps_cluster_ips   = ["10.13.15.250", "10.13.31.250"]

frontends = []
