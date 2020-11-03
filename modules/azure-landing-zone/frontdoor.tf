resource "azurerm_frontdoor" "main" {
  name                                         = "${var.project}-${var.env}"
  location                                     = "global"
  resource_group_name                          = var.resource_group
  enforce_backend_pools_certificate_name_check = var.certificate_name_check
  friendly_name                                = "${var.project}-${var.env}"

  timeouts {
    read   = "4h"
    update = "4h"
  }

  ######## Defaults ########
  frontend_endpoint {
    name                              = "${var.project}-${var.env}-azurefd-net"
    host_name                         = "${var.project}-${var.env}.azurefd.net"
    custom_https_provisioning_enabled = false
  }

  backend_pool_load_balancing {
    name = "defaultLoadBalancing"
  }

  backend_pool_health_probe {
    name = "defaultHealthProbe"
  }

  # Default backend
  backend_pool {
    name = "defaultBackend"
    backend {
      host_header = "www.bing.com"
      address     = "www.bing.com"
      http_port   = 80
      https_port  = 443
    }

    load_balancing_name = "defaultLoadBalancing"
    health_probe_name   = "defaultHealthProbe"
  }

  # Defualt routing rule for default frontend host
  routing_rule {
    name               = "defaultRouting"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["${var.project}-${var.env}-azurefd-net"]
    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "defaultBackend"
    }
  }
  ######## End defaults ########

  ######## Regular frontends ########
  dynamic "frontend_endpoint" {
    iterator = host
    for_each = var.frontends
    content {
      name                                    = host.value["name"]
      host_name                               = host.value["custom_domain"]
      custom_https_provisioning_enabled       = lookup(host.value, "enable_ssl", true)
      web_application_firewall_policy_link_id = "/subscriptions/${var.subscription_id}/resourcegroups/${var.resource_group}/providers/Microsoft.Network/frontdoorwebapplicationfirewallpolicies/${replace(host.value["name"], "-", "")}${replace(var.env, "-", "")}"
      dynamic "custom_https_configuration" {
        for_each = lookup(host.value, "enable_ssl", true) ? [1] : []
        content {
          certificate_source                         = var.ssl_mode
          azure_key_vault_certificate_vault_id       = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault.certificate_vault.id : null
          azure_key_vault_certificate_secret_name    = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault_secret.certificate[host.value["name"]].name : null
          azure_key_vault_certificate_secret_version = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault_secret.certificate[host.value["name"]].version : null
        }
      }
    }
  }

  ######## Additional www frontend ########
  dynamic "frontend_endpoint" {
    iterator = host
    for_each = [
      for frontend in var.frontends : frontend if lookup(frontend, "www_redirect", false)
    ]
    content {
      name                              = "www${host.value["name"]}"
      host_name                         = "www.${host.value["custom_domain"]}"
      custom_https_provisioning_enabled = lookup(host.value, "enable_ssl", true)
      dynamic "custom_https_configuration" {
        for_each = lookup(host.value, "enable_ssl", true) ? [1] : []
        content {
          certificate_source                         = var.ssl_mode
          azure_key_vault_certificate_vault_id       = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault.certificate_vault.id : null
          azure_key_vault_certificate_secret_name    = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault_secret.certificate[host.value["name"]].name : null
          azure_key_vault_certificate_secret_version = var.ssl_mode == "AzureKeyVault" ? data.azurerm_key_vault_secret.certificate[host.value["name"]].version : null
        }
      }
    }
  }

  dynamic "backend_pool_load_balancing" {
    iterator = host
    for_each = var.frontends
    content {
      name                            = "loadBalancingSettings-${host.value["name"]}"
      sample_size                     = 4
      successful_samples_required     = 2
      additional_latency_milliseconds = 0
    }
  }

  dynamic "backend_pool_health_probe" {
    iterator = host
    for_each = var.frontends
    content {
      name                = "healthProbeSettings-${host.value["name"]}"
      interval_in_seconds = 120
      path                = lookup(host.value, "health_path", "/health/liveness")
      protocol            = lookup(host.value, "health_protocol", "Http")
    }
  }

  dynamic "backend_pool" {
    iterator = host
    for_each = var.frontends
    content {
      name = host.value["name"]
      dynamic "backend" {
        iterator = domain
        for_each = host.value["backend_domain"]
        content {
          host_header = lookup(host.value, "host_header", host.value["custom_domain"])
          address     = domain.value
          http_port   = 80
          https_port  = 443
          priority    = 1
          weight      = 50
        }
      }

      load_balancing_name = "loadBalancingSettings-${host.value["name"]}"
      health_probe_name   = "healthProbeSettings-${host.value["name"]}"
    }
  }

  dynamic "routing_rule" {
    iterator = host
    for_each = var.frontends
    content {
      name               = host.value["name"]
      accepted_protocols = lookup(host.value, "enable_ssl", true) ? ["Https"] : ["Http"]
      patterns_to_match  = lookup(host.value, "url_patterns", ["/*"])
      frontend_endpoints = [host.value["name"]]

      forwarding_configuration {
        forwarding_protocol                   = lookup(host.value, "forwarding_protocol", "HttpOnly")
        backend_pool_name                     = host.value["name"]
        cache_enabled                         = lookup(host.value, "cache_enabled", "true")
        cache_query_parameter_strip_directive = "StripNone"
        cache_use_dynamic_compression         = false
        custom_forwarding_path                = ""
      }
    }
  }

  dynamic "routing_rule" {
    iterator = host
    for_each = [
      for frontend in var.frontends : frontend if lookup(frontend, "enable_ssl", true)
    ]
    content {
      name               = "${host.value["name"]}HttpsRedirect"
      accepted_protocols = ["Http"]
      patterns_to_match  = ["/*"]
      frontend_endpoints = [host.value["name"]]

      redirect_configuration {
        redirect_protocol = "HttpsOnly"
        redirect_type     = "Moved"
      }
    }
  }

  dynamic "routing_rule" {
    iterator = host
    for_each = [
      for frontend in var.frontends : frontend if lookup(frontend, "www_redirect", false)
    ]
    content {
      name               = "${host.value["name"]}wwwRedirect"
      accepted_protocols = ["Http", "Https"]
      patterns_to_match  = ["/*"]
      frontend_endpoints = ["www${host.value["name"]}"]

      redirect_configuration {
        redirect_protocol = "HttpsOnly"
        redirect_type     = "Moved"
        custom_host       = host.value["custom_domain"]
      }
    }
  }

  ######## End regular frontends ########

  tags = var.common_tags

  depends_on = [azurerm_frontdoor_firewall_policy.custom, azurerm_key_vault_access_policy.frontdoor_kv_access]
}
