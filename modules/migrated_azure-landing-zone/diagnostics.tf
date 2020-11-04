data "azurerm_log_analytics_workspace" "main" {
  provider = "azurerm.data"

  name                = "hmcts-${var.oms_env}"
  resource_group_name = "oms-automation"
}

data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_frontdoor.main.id
}

resource "azurerm_monitor_diagnostic_setting" "frontdoor_diagnostics" {
  name                       = "fd-log-analytics"
  target_resource_id         = azurerm_frontdoor.main.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.main.id

  dynamic "log" {
    iterator = log
    for_each = [for category in data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs : {
      category = category
    }]

    content {
      category = log.value.category
      enabled  = true

      retention_policy {
        enabled = true
      }
    }
  }

  dynamic "metric" {
    iterator = metric
    for_each = [for category in data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics : {
      category = category
    }]

    content {
      category = metric.value.category
      enabled  = true

      retention_policy {
        enabled = true
      }
    }
  }
}
