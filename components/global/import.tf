import {
  to = module.frontdoor_classic[0].azurerm_cdn_frontdoor_profile.front_door
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}"
}

import {
  to = module.frontdoor_classic[0].azurerm_cdn_frontdoor_endpoint.endpoint
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}"
}

import {
  to = module.frontdoor_classic[0].azurerm_cdn_frontdoor_origin_group.defaultBackend
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/defaultBackend"
}
