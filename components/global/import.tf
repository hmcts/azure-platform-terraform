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
#   to = module.premium_front_door[0].azurerm_key_vault_access_policy.frontdoor_premium_kv_access[0]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.KeyVault/vaults/acmedcdcftapps${var.env}/objectId/8523e6b9-8461-46fd-abb9-1b2491384367"
# }


import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-web-public"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[0].name}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["hmcts-access"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[1].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-web-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[2].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-user-dashboard"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[3].name}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["plum"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[4].name}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["plumclassic"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[5].name}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["hmi-apim"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[6].name}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["cft-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[7].name}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["reformscan"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[8].name}"
}

import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["labs-rhodrif-nodejs"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[9].name}"
}
