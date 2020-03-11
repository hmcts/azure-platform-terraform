locals {
  gateways = yamldecode(data.local_file.configuration.content).gateways
}

data "local_file" "configuration" {
  filename = var.yaml_path
}

resource "azurerm_application_gateway" "ag" {
  name                = "aks${format("%02d", count.index)}-${var.env}-agw"
  resource_group_name = local.vnet_rg
  location            = var.location
  tags                = local.tags

  count = length(local.gateways)

  sku {
    name = "Standard_v2"
    tier = "Standard_v2"
  }

  autoscale_configuration {
    min_capacity = var.min_capacity
    max_capacity = var.max_capacity
  }

  gateway_ip_configuration {
    name      = "gateway"
    subnet_id = data.azurerm_subnet.app_gw.id
  }

  frontend_port {
    name = "http"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "appGwPublicFrontendIp"
    public_ip_address_id = azurerm_public_ip.app_gw.id
  }

  frontend_ip_configuration {
    name                          = "appGwPrivateFrontendIp"
    subnet_id                     = data.azurerm_subnet.app_gw.id
    private_ip_address            = var.private_ip_address
    private_ip_address_allocation = "Static"
  }

  dynamic "backend_address_pool" {
    for_each = [for app in local.gateways[count.index].app_configuration : {
      name = "${app.product}-${app.component}"
    }]

    content {
      name         = backend_address_pool.value.name
      ip_addresses = local.gateways[count.index].gateway_configuration.backend_pool_addresses
    }
  }

  dynamic "probe" {
    for_each = [for app in local.gateways[count.index].app_configuration : {
      name = "${app.product}-${app.component}"
      host = "${app.product}-${app.component}-${var.env}.${local.gateways[count.index].gateway_configuration.host_name_suffix}"
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

  dynamic "backend_http_settings" {
    for_each = [for app in local.gateways[count.index].app_configuration : {
      name                  = "${app.product}-${app.component}"
      cookie_based_affinity = contains(keys(app), "cookie_based_affinity") ? app.cookie_based_affinity : "Disabled"
    }]

    content {
      name                  = backend_http_settings.value.name
      probe_name            = backend_http_settings.value.name
      cookie_based_affinity = backend_http_settings.value.cookie_based_affinity
      port                  = 80
      protocol              = "Http"
      request_timeout       = 30
    }
  }

  dynamic "http_listener" {
    for_each = [for app in local.gateways[count.index].app_configuration : {
      name = "${app.product}-${app.component}"
    }]

    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = "appGwPrivateFrontendIp"
      frontend_port_name             = "http"
      protocol                       = "Http"
      host_name                      = "${http_listener.value.name}-${var.env}.${local.gateways[count.index].gateway_configuration.host_name_suffix}"
    }
  }

  dynamic "request_routing_rule" {
    for_each = [for app in local.gateways[count.index].app_configuration : {
      name = "${app.product}-${app.component}"
    }]

    content {
      name                       = request_routing_rule.value.name
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.name
      backend_address_pool_name  = request_routing_rule.value.name
      backend_http_settings_name = request_routing_rule.value.name
    }
  }
}

data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = azurerm_application_gateway.ag[0].id
}

data "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "hmcts-${var.env}-law"
  resource_group_name = "oms-automation-rg"
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_settings" {
  name                       = "AppGw"
  count                      = length(local.gateways)
  target_resource_id         = azurerm_application_gateway.ag[count.index].id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics.id

  dynamic "log" {
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
