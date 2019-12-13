project                    = "hmcts"
component                  = "lz"
location                   = "uksouth"
env                        = "perftest"
subscription               = "test"
waf_mode                   = "Detection"
enable_ssl                 = false
ssl_mode                    = "AzureKeyVault"
certificate_key_vault_name = "cftapps-test"

cft_apps_ag_ip_address = "10.10.46.123"
cft_apps_cluster_ips   = ["10.10.41.250", "10.10.45.250"]

frontends = []
