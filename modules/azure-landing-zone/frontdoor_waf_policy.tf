resource "azurerm_frontdoor_firewall_policy" "custom" {
  count               = length(var.frontend_with_disabled_waf_rules)
  name                = lookup(element(var.frontend_with_disabled_waf_rules, count.index), "name")
  resource_group_name = "dmz-frontdoor-rg"
  enabled             = true
  mode                = "Detection"

  managed_rule {
    type    = "DefaultRuleSet"
    version = "1.0"

    dynamic "override" {
      iterator = rulesets
      for_each = lookup(element(var.frontend_with_disabled_waf_rules, count.index), "rules")

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

  managed_rule {
    type    = "BotProtection"
    version = "preview-0.1"
  }
}