resource "azurerm_frontdoor_firewall_policy" "custom" {
  for_each = { for frontend in var.frontends :
    frontend.name => frontend
  }
  name                = "${replace(lookup(each.value, "name"), "-", "")}${replace(var.env, "-", "")}"
  resource_group_name = var.resource_group
  enabled             = true
  mode                = lookup(each.value, "mode", "Prevention")

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    dynamic "exclusion" {
      iterator = exclusion
      for_each = lookup(each.value, "global_exclusions", [])

      content {
        match_variable = exclusion.value.match_variable
        operator       = exclusion.value.operator
        selector       = exclusion.value.selector
      }
    }

    dynamic "override" {
      iterator = rulesets
      for_each = lookup(each.value, "disabled_rules", {})

      content {
        rule_group_name = rulesets.key

        dynamic "rule" {
          iterator = rule_id
          for_each = rulesets.value

          content {
            rule_id = rule_id.value
            enabled = false
            action  = "Block"
          }
        }
      }
    }
  }

  dynamic "custom_rule" {
    iterator = custom_rule
    for_each = lookup(each.value, "custom_rules", [])

    content {
      name     = custom_rule.value.name
      enabled  = true
      priority = custom_rule.value.priority
      type     = custom_rule.value.type
      action   = custom_rule.value.action

      dynamic "match_condition" {
        iterator = match_condition
        for_each = lookup(custom_rule.value, "match_conditions", [])
        content {
          match_variable     = match_condition.value.match_variable
          operator           = match_condition.value.operator
          negation_condition = match_condition.value.negation_condition
          match_values       = match_condition.value.match_values
        }
      }
    }
  }
}