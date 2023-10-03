import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_profile.front_door
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_endpoint.endpoint
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.defaultBackend
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/defaultBackend"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.default_routing_rule
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/defaultRouting"
}

# import {
#   to = module.premium_front_door[0].azurerm_monitor_diagnostic_setting.frontdoor_diagnostics
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}|fd-log-analytics"
# }
