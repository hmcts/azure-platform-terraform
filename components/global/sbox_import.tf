# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_profile.front_door
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_endpoint.endpoint
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.defaultBackend
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/defaultBackend"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.default_routing_rule
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/defaultRouting"
# }

# import {
#   to = module.premium_front_door[0].azurerm_key_vault_access_policy.frontdoor_premium_kv_access[0]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/cft-platform-${var.env}-rg/providers/Microsoft.KeyVault/vaults/acmedcdcftapps${var.env}/objectId/8523e6b9-8461-46fd-abb9-1b2491384367"
# }


# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[0].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["hmcts-access"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[1].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[2].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[3].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[4].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["plumclassic"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[5].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[6].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[7].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[8].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["labs-rhodrif-nodejs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[9].name}"
# }



# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[0].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["hmcts-access"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[1].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[2].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[3].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[4].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["plumclassic"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[5].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[6].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[7].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[8].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["labs-rhodrif-nodejs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[9].name}"
# }

# #### End #####

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[0].name, "-", "")}${var.env}Premium"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["hmcts-access"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[1].name, "-", "")}${var.env}Premium"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[2].name, "-", "")}${var.env}Premium"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[3].name, "-", "")}${var.env}Premium"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[4].name, "-", "")}${var.env}Premium"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["plumclassic"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[5].name, "-", "")}${var.env}Premium"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[6].name, "-", "")}${var.env}Premium"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[7].name, "-", "")}${var.env}Premium"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[8].name, "-", "")}${var.env}Premium"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["labs-rhodrif-nodejs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[9].name, "-", "")}${var.env}Premium"
# }

# #########
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[0].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["hmcts-access"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[1].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[2].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[3].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[4].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["plumclassic"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[5].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[6].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[7].name}"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[8].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["labs-rhodrif-nodejs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[9].name}"
# }

# #############################
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[0].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["hmcts-access"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[1].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[2].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[3].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[4].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["plumclassic"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[5].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[6].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[7].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[8].name}HttpsRedirect"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["labs-rhodrif-nodejs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[9].name}HttpsRedirect"
# }

# #############

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[0].name, "-", "")}${var.env}Premium-securityPolicy"
# }

# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["hmcts-access"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[1].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[2].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[3].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[4].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["plumclassic"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[5].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[6].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[7].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[8].name, "-", "")}${var.env}Premium-securityPolicy"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["labs-rhodrif-nodejs"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[9].name, "-", "")}${var.env}Premium-securityPolicy"
# }

