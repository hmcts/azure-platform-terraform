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
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["plum"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[0].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["plum"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[0].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["plum"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[0].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[0].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["plum"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[0].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["plum"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[0].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["div-dn"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[1].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["div-dn"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[1].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["div-dn"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[1].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["div-dn"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[1].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["div-dn"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[1].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["div-dn"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[1].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["div-da"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[2].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["div-da"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[2].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["div-da"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[2].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["div-da"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[2].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["div-da"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[2].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["div-da"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[2].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["div-rfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[3].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["div-rfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[3].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["div-rfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[3].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["div-rfe"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[3].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["div-rfe"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[3].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["div-rfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[3].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["div-pfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[4].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["div-pfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[4].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["div-pfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[4].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["div-pfe"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[4].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["div-pfe"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[4].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["div-pfe"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[4].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["div-amend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[5].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["div-amend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[5].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["div-amend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[5].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["div-amend"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[5].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["div-amend"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[5].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["div-amend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[5].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["nfdiv-civil-partnership"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[6].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["nfdiv-civil-partnership"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[6].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["nfdiv-civil-partnership"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[6].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["nfdiv-civil-partnership"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[6].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["nfdiv-civil-partnership"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[6].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["nfdiv-civil-partnership"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[6].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sscs-tribunals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[7].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sscs-tribunals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[7].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sscs-tribunals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[7].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sscs-tribunals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[7].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sscs-tribunals"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[7].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sscs-tribunals"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[7].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sscs-tya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[8].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sscs-tya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[8].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sscs-tya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[8].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sscs-tya"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[8].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sscs-tya"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[8].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sscs-tya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[8].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sscs-cor"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[9].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sscs-cor"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[9].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sscs-cor"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[9].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sscs-cor"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[9].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sscs-cor"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[9].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sscs-cor"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[9].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["xui-webapp"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[10].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["xui-webapp"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[10].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["xui-webapp"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[10].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["xui-webapp"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[10].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["xui-webapp"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[10].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["xui-webapp"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[10].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["xui-manage-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[11].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["xui-manage-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[11].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["xui-manage-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[11].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["xui-manage-org"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[11].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["xui-manage-org"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[11].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["xui-manage-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[11].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["xui-approve-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[12].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["xui-approve-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[12].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["xui-approve-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[12].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["xui-approve-org"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[12].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["xui-approve-org"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[12].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["xui-approve-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[12].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["xui-register-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[13].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["xui-register-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[13].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["xui-register-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[13].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["xui-register-org"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[13].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["xui-register-org"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[13].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["xui-register-org"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[13].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["cmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[14].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["cmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[14].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["cmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[14].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["cmc"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[14].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["cmc"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[14].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["cmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[14].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["ocmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[15].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["ocmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[15].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["ocmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[15].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["ocmc"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[15].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["ocmc"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[15].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["ocmc"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[15].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["cmc-legal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[16].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["cmc-legal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[16].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["cmc-legal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[16].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["cmc-legal"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[16].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["cmc-legal"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[16].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["cmc-legal"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[16].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["gateway-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[17].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["gateway-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[17].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["gateway-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[17].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["gateway-ccd"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[17].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["gateway-ccd"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[17].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["gateway-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[17].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["return-case-doc-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[18].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["return-case-doc-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[18].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["return-case-doc-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[18].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["return-case-doc-ccd"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[18].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["return-case-doc-ccd"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[18].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["return-case-doc-ccd"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[18].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["probate"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[19].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["probate"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[19].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["probate"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[19].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["probate"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[19].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["probate"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[19].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["probate"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[19].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["ia-aip"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[20].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["ia-aip"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[20].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["ia-aip"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[20].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["ia-aip"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[20].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["ia-aip"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[20].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["ia-aip"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[20].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["fees-register"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[21].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["fees-register"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[21].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["fees-register"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[21].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["fees-register"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[21].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["fees-register"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[21].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["fees-register"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[21].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["paybubble"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[22].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["paybubble"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[22].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["paybubble"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[22].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["paybubble"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[22].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["paybubble"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[22].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["paybubble"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[22].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["manage-payments"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[23].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["manage-payments"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[23].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["manage-payments"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[23].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["manage-payments"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[23].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["manage-payments"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[23].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["manage-payments"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[23].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["payment-outcome"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[24].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["payment-outcome"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[24].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["payment-outcome"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[24].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["payment-outcome"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[24].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["payment-outcome"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[24].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["payment-outcome"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[24].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-web-public"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[25].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["idam-web-public"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[25].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["idam-web-public"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[25].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[25].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["idam-web-public"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[25].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["idam-web-public"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[25].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["pcq"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[26].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["pcq"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[26].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["pcq"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[26].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["pcq"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[26].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["pcq"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[26].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["pcq"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[26].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["lau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[27].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["lau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[27].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["lau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[27].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["lau"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[27].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["lau"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[27].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["lau"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[27].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["cft-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[28].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["cft-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[28].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["cft-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[28].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[28].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["cft-api-mgmt"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[28].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["cft-api-mgmt"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[28].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["fact"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[29].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["fact"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[29].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["fact"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[29].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["fact"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[29].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["fact"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[29].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["fact"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[29].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["fact-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[30].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["fact-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[30].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["fact-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[30].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["fact-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[30].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["fact-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[30].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["fact-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[30].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["fact-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[31].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["fact-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[31].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["fact-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[31].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["fact-redirect"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[31].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["fact-redirect"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[31].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["fact-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[31].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["jui-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[32].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["jui-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[32].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["jui-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[32].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["jui-redirect"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[32].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["jui-redirect"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[32].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["jui-redirect"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[32].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-web-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[33].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["idam-web-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[33].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["idam-web-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[33].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[33].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["idam-web-admin"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[33].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["idam-web-admin"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[33].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["idam-user-dashboard"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[34].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["idam-user-dashboard"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[34].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["idam-user-dashboard"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[34].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[34].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["idam-user-dashboard"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[34].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["idam-user-dashboard"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[34].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["hmi-apim"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[35].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["hmi-apim"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[35].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["hmi-apim"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[35].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[35].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["hmi-apim"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[35].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["hmi-apim"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[35].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["reformscan"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[36].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["reformscan"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[36].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["reformscan"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[36].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[36].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["reformscan"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[36].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["reformscan"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[36].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[37].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[37].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[37].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["adoption"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[37].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["adoption"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[37].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[37].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["private-law"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[38].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["private-law"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[38].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["private-law"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[38].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["private-law"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[38].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["private-law"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[38].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["private-law"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[38].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["et-sya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[39].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["et-sya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[39].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["et-sya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[39].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["et-sya"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[39].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["et-sya"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[39].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["et-sya"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[39].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sptribs-frontend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[40].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sptribs-frontend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[40].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sptribs-frontend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[40].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sptribs-frontend"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[40].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sptribs-frontend"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[40].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sptribs-frontend"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[40].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["dtsse-ardoq-adapter"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[41].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["dtsse-ardoq-adapter"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[41].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["dtsse-ardoq-adapter"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[41].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["dtsse-ardoq-adapter"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[41].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["dtsse-ardoq-adapter"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[41].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["dtsse-ardoq-adapter"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[41].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["response"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[42].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["response"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[42].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["response"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[42].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["response"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[42].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["response"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[42].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["response"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[42].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[43].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[43].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[43].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["sandbox-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[43].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["sandbox-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[43].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["sandbox-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[43].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[44].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[44].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[44].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[44].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[44].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[44].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["static-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[45].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["static-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[45].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["static-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[45].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["static-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[45].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["static-build"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[45].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["static-build"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[45].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["et-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[46].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["et-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[46].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["et-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[46].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["et-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[46].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["et-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[46].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["et-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[46].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["et-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[47].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["et-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[47].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["et-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[47].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["et-staff-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[47].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["et-staff-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[47].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["et-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[47].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["et-response-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[48].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["et-response-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[48].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["et-response-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[48].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["et-response-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[48].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["et-response-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[48].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["et-response-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[48].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["tt-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[49].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["tt-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[49].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["tt-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[49].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["tt-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[49].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["tt-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[49].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["tt-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[49].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["hwf-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[50].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["hwf-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[50].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["hwf-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[50].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["hwf-staff-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[50].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["hwf-staff-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[50].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["hwf-staff-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[50].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["hwf-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[51].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["hwf-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[51].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["hwf-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[51].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["hwf-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[51].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["hwf-pet"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[51].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["hwf-pet"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[51].name, "-", "")}${var.env}Premium-securityPolicy"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_origin_group.origin_group["child-adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/originGroups/${var.frontends[52].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_custom_domain.custom_domain["child-adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/customDomains/${var.frontends[52].name}"
}
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_firewall_policy.custom["child-adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Network/frontDoorWebApplicationFirewallPolicies/${replace(var.frontends[52].name, "-", "")}${var.env}Premium"
}
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_A["child-adoption"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[52].name}"
# }
# import {
#   to = module.premium_front_door[0].azurerm_cdn_frontdoor_route.routing_rule_B["child-adoption"]
#   id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/afdEndpoints/${var.project}-${var.env}/routes/${var.frontends[52].name}HttpsRedirect"
# }
import {
  to = module.premium_front_door[0].azurerm_cdn_frontdoor_security_policy.security_policy["child-adoption"]
  id = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${data.azurerm_resource_group.main.name}/providers/Microsoft.Cdn/profiles/${var.project}-${var.env}/securityPolicies/${replace(var.frontends[52].name, "-", "")}${var.env}Premium-securityPolicy"
}
