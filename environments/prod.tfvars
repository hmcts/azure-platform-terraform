project                    = "hmcts"
component                  = "lz"
location                   = "uksouth"
env                        = "prod"
subscription               = "prod"
waf_mode                   = "Detection"
enable_ssl                 = false
sslMode                    = "AzureKeyVault"
certificate_key_vault_name = "cft-apps-prod"

cft_apps_ag_ip_address = "10.13.32.122"
cft_apps_cluster_ips   = ["10.13.15.250", "10.13.31.250"]

frontends = []
