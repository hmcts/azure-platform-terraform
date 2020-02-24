/*
resource "azurerm_resource_group" "main" {####
  name     = "example-resources"
  location = var.location####uksouth / UK South
}
*/

/*
resource "azurerm_monitor_action_group" "main" {
  name                = "aks_${var.env}_action_group"
  resource_group_name = "core-infra-${var.env}-rg"
  short_name          = "aks${var.env}"

  webhook_receiver {####
    name        = "callmyapi"
    service_uri = "http://example.com/alert"
  }####
}
*/

resource "azurerm_monitor_metric_alert" "main" { ##
  foreach             = var.frontends
  name                = "${each.value.name}-backend-pool-alert" //"${var.project}-${var.env}_${var.frontends[].name}-backend-pool-alert"
  resource_group_name = var.resource_group
  scopes              = [azurerm_frontdoor.main.id]
  description         = "Action will be triggered when Backend Health Percentage is Less than 95%"

  criteria {
    metric_namespace = "Microsoft.Network/frontDoors" ####
    metric_name      = "BackendHealthPercentage"
    aggregation      = "Avg"
    operator         = "LessThan"
    threshold        = 95

    dimension {
      name     = "BackendPool"
      operator = "Equals"
      values   = "${var.project}-${var.env}_${each.value.name}" ####
    }
  }

  action {
    action_group_id = "aks_${var.env}_action_group" //azurerm_monitor_action_group.main.id
  }
}

/*
  dynamic "alert" {
    for_each = [for backend in var.frontends : {
      name = hmcts-${var.env}_backend.name
      backend_pool = backend_pool.name
      path = lookup(app, "health_path_override", "/health/liveness")
    }]

    content {
      interval            = 10
      name                = probe.value.name // each.value.name
      host                = probe.value.host
      path                = probe.value.path
      protocol            = "Http"
      timeout             = 15
      unhealthy_threshold = 3
    }
  }
*/

/*
 dynamic "backend_pool" {
    iterator = host
    for_each = var.frontends
    content {
      name = host.value["name"]
      dynamic "backend" {
        iterator = domain
        for_each = host.value["backend_domain"]
        content {
          host_header = host.value["custom_domain"]
          address     = domain.value
          http_port   = 80
          https_port  = 443
          priority    = 1
          weight      = 50
        }
      }
*/