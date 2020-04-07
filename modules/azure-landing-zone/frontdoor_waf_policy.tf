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
}