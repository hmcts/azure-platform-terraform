locals {
  x_fwded_proto_ruleset = "x_fwded_proto"
  x_fwded_for_ruleset   = "x_fwded_for"
}

resource "azurerm_application_gateway" "ag" {
  name                = "aks-fe-${format("%02d", count.index)}-${var.env}-agw"
  resource_group_name = local.vnet_rg
  location            = var.location
  tags                = var.common_tags

  count = length(var.frontends) != 0 ? 1 : 0

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
    public_ip_address_id = azurerm_public_ip.app_gw[0].id
  }

  frontend_ip_configuration {
    name                          = "appGwPrivateFrontendIp"
    subnet_id                     = data.azurerm_subnet.app_gw.id
    private_ip_address            = var.private_ip_address
    private_ip_address_allocation = "Static"
  }

  dynamic "backend_address_pool" {
    for_each = [for app in var.frontends : {
      name = app.name
    }]

    content {
      name         = backend_address_pool.value.name
      ip_addresses = var.destinations
    }
  }

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

  dynamic "backend_http_settings" {
    for_each = [for app in var.frontends : {
      name = app.name
    }]

    content {
      name                  = backend_http_settings.value.name
      probe_name            = backend_http_settings.value.name
      cookie_based_affinity = "Disabled"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 30
    }
  }

  dynamic "http_listener" {
    for_each = [for app in var.frontends : {
      name          = app.name
      custom_domain = app.custom_domain
    }]

    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = "appGwPrivateFrontendIp"
      frontend_port_name             = "http"
      protocol                       = "Http"
      host_name                      = http_listener.value.custom_domain
    }
  }

  dynamic "request_routing_rule" {
    for_each = [for app in var.frontends : {
      name = app.name
    }]

    content {
      name                       = request_routing_rule.value.name
      rule_type                  = "Basic"
      http_listener_name         = request_routing_rule.value.name
      backend_address_pool_name  = request_routing_rule.value.name
      backend_http_settings_name = request_routing_rule.value.name
      rewrite_rule_set_name      = local.x_fwded_proto_ruleset
    }
  }

  rewrite_rule_set {
    name = local.x_fwded_proto_ruleset

    # rewrite_rule {
    #   name          = local.x_fwded_proto_ruleset
    #   rule_sequence = 90

    #   request_header_configuration {
    #     header_name  = "X-Forwarded-Proto"
    #     header_value = "https"
    #   }
    # }

    rewrite_rule {
      name          = local.x_fwded_for_ruleset
      rule_sequence = 100

      request_header_configuration {
        header_name  = "X-Forwarded-For"
        header_value = "(var_add_x_forwarded_for_proxy server)"
      }
    }
  }
}

data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  count = length(var.frontends) != 0 ? 1 : 0

  resource_id = azurerm_application_gateway.ag[0].id
}

data "azurerm_log_analytics_workspace" "log_analytics" {
  count = length(var.frontends) != 0 ? 1 : 0

  name                = "hmcts-${var.env}-law"
  resource_group_name = "oms-automation-rg"
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_settings" {
  name                       = "AppGw"
  count                      = length(var.frontends) != 0 ? 1 : 0
  target_resource_id         = azurerm_application_gateway.ag[count.index].id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.log_analytics[0].id

  dynamic "log" {
    for_each = [for category in data.azurerm_monitor_diagnostic_categories.diagnostic_categories[0].logs : {
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
    for_each = [for category in data.azurerm_monitor_diagnostic_categories.diagnostic_categories[0].metrics : {
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
