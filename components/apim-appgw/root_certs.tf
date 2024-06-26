locals {
  trusted_client_certificates = {
    sbox = {
    }
    test = {
      civil_sdt_root_ca     = "civil-sdt-root-ca"
      reform_scan_sscs_ca   = "reform-scan-sscs-ca"
      dts_bsp_team_ca       = "dts-bsp-team-ca"
      exela_uat_ca          = "exela-uat-ca"
      iron_mountain_ca      = "iron-mountain-ca"
    }
    prod = {
      civil_sdt_root_ca = "civil-sdt-root-ca"
    }
  }

  trusted_client_certificate_data = lookup(local.trusted_client_certificates, local.env, {})
  cert_names                      = [for cert_name, cert_value in local.trusted_client_certificate_data : cert_name if cert_value != ""]
}


data "azurerm_key_vault" "key_vault" {
  name                = local.key_vault_name
  resource_group_name = local.key_vault_resource_group

  provider = azurerm.kv
}

data "azurerm_key_vault_secret" "secrets" {
  for_each     = toset(local.cert_names)
  name         = lookup(local.trusted_client_certificate_data, each.key)
  key_vault_id = data.azurerm_key_vault.key_vault.id

  provider = azurerm.kv
}