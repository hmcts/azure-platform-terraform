resource "azurerm_log_analytics_workspace" "main" {
  count               = length(var.firewall_location)
  name                = "${var.project}-${var.env}-fw-loganalytics"
  location            = "${azurerm_resource_group.main[count.index].location}"
  resource_group_name = "${azurerm_resource_group.main[count.index].name}"
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "firewall_diagnostics" {
  count                      = length(var.firewall_location)
  name                       = "fw-log-analytics"
  target_resource_id         = azurerm_firewall.main[count.index].id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main[count.index].id

  log {
    category = "AzureFirewallApplicationRule"

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "AzureFirewallNetworkRule"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}