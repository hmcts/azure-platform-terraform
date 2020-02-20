resource "azurerm_resource_group" "main" {####
  name     = "example-resources"
  location = var.location####uksouth / UK South
}

resource "azurerm_monitor_action_group" "main" {
  name                = "aks_${var.env}_action_group"
  resource_group_name = "core-infra-${var.env}-rg"
  short_name          = "aks${var.env}"

  webhook_receiver {####
    name        = "callmyapi"
    service_uri = "http://example.com/alert"
  }####
}

resource "azurerm_monitor_metric_alert" "main" { ##
  name                = "example-metricalert"
  resource_group_name = azurerm_resource_group.main.name
  scopes              = [azurerm_storage_account.to_monitor.id]
  description         = "Action will be triggered when Backend Health Percentage is Less than 95%"

  criteria {
    metric_namespace = "Microsoft.Network/frontDoors"####
    metric_name      = "BackendHealthPercentage"
    aggregation      = "Avg"
    operator         = "LessThan"
    threshold        = 95

    dimension {
      name     = "BackendPool"
      operator = "Equals"
      values   = "${var.frontends.name}"####
    }
  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

/*
  dynamic "probe" {
    for_each = [for app in var.frontends : {
      name = app.name
      host = app.custom_domain
      path = lookup(app, "health_path_override", "/health/liveness")
    }]

    content {
      interval            = 10
      name                = probe.value.name
      host                = probe.value.host
      path                = probe.value.path
      protocol            = "Http"
      timeout             = 15
      unhealthy_threshold = 3
    }
  }
*\