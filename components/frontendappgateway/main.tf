module "logworkspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=master"
  environment = var.env
}

module "ctags" {
  source       = "git::https://github.com/hmcts/terraform-module-common-tags.git?ref=master"
  environment  = var.env
  product      = var.product
  builtFrom    = var.builtFrom
  expiresAfter = var.expiresAfter
  autoShutdown = var.autoShutdown
}

data "azurerm_subscription" "current" {}

module "frontendappgateway" {
  providers = {
    azurerm     = azurerm
    azurerm.hub = azurerm.hub
    azurerm.kv  = azurerm.kv
  }

  source = "git::https://github.com/hmcts/terraform-module-applicationgateway.git?ref=master"

  env                                = var.env
  subscription                       = var.subscription
  location                           = var.location
  private_ip_address                 = var.frontend_agw_private_ip_address
  destinations                       = var.cft_apps_cluster_ips
  frontends                          = var.frontends
  common_tags                        = module.ctags.common_tags
  oms_env                            = var.oms_env
  project                            = var.project
  vnet_rg                            = local.vnet_rg
  vnet_name                          = local.vnet_name
  log_analytics_workspace_id         = module.logworkspace.workspace_id
  enable_multiple_availability_zones = true
  resource_prefix                    = "cft"
  min_capacity                       = var.frontend_agw_min_capacity
  max_capacity                       = var.frontend_agw_max_capacity
  diagnostics_storage_account_id     = data.azurerm_storage_account.diagnostics.id
  vault_name                         = local.key_vault_name
  key_vault_resource_group           = local.key_vault_resource_group
  ssl_certificate_name               = var.ssl_certificate
  ssl_policy                         = var.ssl_policy
}

resource "azurerm_postgresql_flexible_server" "tamopspsql" {
  name                   = "tamops-psqlflexibleserver"
  resource_group_name    = local.vnet_rg
  location               = "uksouth"
  version                = "16"
  administrator_login    = "thomas"
  administrator_password = "passwordsarefun"
  zone                   = "2"

  storage_mb = 32768

  sku_name                     = "GP_Standard_D48ds_v4"
  geo_redundant_backup_enabled = false

  high_availability {
    mode                      = "ZoneRedundant"
    standby_availability_zone = "3"
  }
}
resource "azurerm_postgresql_flexible_server_database" "tamopspsqldb" {
  name      = "tamopsdb"
  server_id = azurerm_postgresql_flexible_server.tamopspsql.id
  collation = "en_US.utf8"
  charset   = "utf8"
}