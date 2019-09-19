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
    for_each = var.frontend_hosts
    content {
      name                                    = host.value
      host_name                               = "${host.value}.${var.custom_domain_name}"
      custom_https_provisioning_enabled       = true
      web_application_firewall_policy_link_id = azurerm_frontdoor_firewall_policy.default.id
      custom_https_configuration {
        certificate_source = "FrontDoor"
      }
    }
  }

  dynamic "backend_pool_load_balancing" {
    iterator = host
    for_each = var.frontend_hosts
    content {
      name                            = "loadBalancingSettings-${host.value}"
      sample_size                     = 4
      successful_samples_required     = 2
      additional_latency_milliseconds = 0
    }
  }

  dynamic "backend_pool_health_probe" {
    iterator = host
    for_each = var.frontend_hosts
    content {
      name                = "healthProbeSettings-${host.value}"
      interval_in_seconds = 30
      path                = "/"
      protocol            = "Https"
    }
  }

  dynamic "backend_pool" {
    iterator = host
    for_each = var.frontend_hosts
    content {
      name = host.value
      dynamic "backend" {
        iterator = domain
        for_each = var.backend_domain
        content {
          host_header = "${host.value}.${var.env}.${domain.value}"
          address     = "${host.value}.${var.env}.${domain.value}"
          http_port   = 80
          https_port  = 443
          priority    = 1
          weight      = 50
        }
      }

      load_balancing_name = "loadBalancingSettings-${host.value}"
      health_probe_name   = "healthProbeSettings-${host.value}"
    }
  }

  dynamic "routing_rule" {
    iterator = host
    for_each = var.frontend_hosts
    content {
      name               = "${host.value}Rule"
      accepted_protocols = ["Http", "Https"]
      patterns_to_match  = ["/*"]
      frontend_endpoints = [host.value]

      forwarding_configuration {
        forwarding_protocol                   = "MatchRequest"
        backend_pool_name                     = host.value
        cache_query_parameter_strip_directive = "StripNone"
        cache_use_dynamic_compression         = false
        custom_forwarding_path                = ""
      }
    }
  }

  tags = "${var.common_tags}"
}
