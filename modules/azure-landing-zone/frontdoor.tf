resource "azurerm_frontdoor" "main" {
  name                                         = "${var.project}-${var.env}"
  location                                     = "global"
  resource_group_name                          = azurerm_resource_group.main.name
  enforce_backend_pools_certificate_name_check = true
  friendly_name                                = "${var.project}-${var.env}"

  frontend_endpoint {
    name                              = "${var.project}-${var.env}-azurefd-net"
    host_name                         = "${var.project}-${var.env}.azurefd.net"
    custom_https_provisioning_enabled = false
  }

  dynamic "frontend_endpoint" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name                                    = "${lookup(host.value, "name")}"
      host_name                               = "${lookup(host.value, "name")}.${var.custom_domain_name}"
      custom_https_provisioning_enabled       = true
      web_application_firewall_policy_link_id = "${lookup(host.value, "name")}"
      custom_https_configuration {
        certificate_source = "FrontDoor"
      }
    }
  }

  dynamic "backend_pool_load_balancing" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name                            = "loadBalancingSettings-${lookup(host.value, "name")}"
      sample_size                     = 4
      successful_samples_required     = 2
      additional_latency_milliseconds = 0
    }
  }

  dynamic "backend_pool_health_probe" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name                = "healthProbeSettings-${lookup(host.value, "name")}"
      interval_in_seconds = 30
      path                = "/"
      protocol            = "Https"
    }
  }

  dynamic "backend_pool" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name = "${lookup(host.value, "name")}"
      dynamic "backend" {
        iterator = domain
        for_each = var.backend_domain
        content {
          host_header = "${lookup(host.value, "name")}.${var.env}.${domain.value}"
          address     = "${lookup(host.value, "name")}.${var.env}.${domain.value}"
          http_port   = 80
          https_port  = 443
          priority    = 1
          weight      = 50
        }
      }

      load_balancing_name = "loadBalancingSettings-${lookup(host.value, "name")}"
      health_probe_name   = "healthProbeSettings-${lookup(host.value, "name")}"
    }
  }

  dynamic "routing_rule" {
    iterator = host
    for_each = var.frontend_with_disabled_waf_rules
    content {
      name               = "${lookup(host.value, "name")}Rule"
      accepted_protocols = ["Http", "Https"]
      patterns_to_match  = ["/*"]
      frontend_endpoints = ["${lookup(host.value, "name")}"]

      forwarding_configuration {
        forwarding_protocol                   = "MatchRequest"
        backend_pool_name                     = "${lookup(host.value, "name")}"
        cache_query_parameter_strip_directive = "StripNone"
        cache_use_dynamic_compression         = false
        custom_forwarding_path                = ""
      }
    }
  }

  tags = "${var.common_tags}"
  depends_on = [
    azurerm_frontdoor_firewall_policy.custom
  ]
}
