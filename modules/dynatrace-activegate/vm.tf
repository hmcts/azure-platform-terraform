locals {
  prefix      = var.config_file_name == "cloudconfig-private" ? "activegate-private-${var.env}" : "activegate-${var.env}"
  environment = var.env == "ptl" ? "prod" : "${var.env}"
  adminuser   = "azureuser"
}

data "azurerm_subnet" "iaas" {
  name                 = "iaas"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
}

data "azurerm_key_vault" "subscription_vault" {
  name                = var.vault_name
  resource_group_name = var.vault_rg
}

data "azurerm_key_vault_secret" "dynatrace_paas_token" {
  name         = "dynatrace-${var.env}-paas-token"
  key_vault_id = data.azurerm_key_vault.subscription_vault.id
}

data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "aks-ssh-pub-key"
  key_vault_id = data.azurerm_key_vault.subscription_vault.id
}

data "azurerm_storage_account" "dynatrace_plugin_storage" {
  name                = var.storage_account
  resource_group_name = var.storage_account_rg
}


data "template_file" "cloudconfig" {
  template = file("${path.module}/${var.config_file_name}.tpl")

  vars = {
    paas_token               = data.azurerm_key_vault_secret.dynatrace_paas_token.value
    dynatrace_instance_name  = var.dynatrace_instance_name
    network_zone             = var.network_zone
    plugin_storage_account   = data.azurerm_storage_account.dynatrace_plugin_storage.name
    plugin_storage_container = var.storage_container
    plugin_storage_key       = data.azurerm_storage_account.dynatrace_plugin_storage.primary_access_key
    dynatrace_plugins        = join(" ", var.dynatrace_plugins)
  }
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = data.template_file.cloudconfig.rendered
  }
}

data "azurerm_key_vault" "soc_vault" {
  provider            = azurerm.soc
  name                = var.soc_vault_name
  resource_group_name = var.soc_vault_rg
}

data "azurerm_key_vault_secret" "splunk_username" {
  provider     = azurerm.soc
  name         = var.splunk_username_secret
  key_vault_id = data.azurerm_key_vault.soc_vault.id
}

data "azurerm_key_vault_secret" "splunk_password" {
  provider     = azurerm.soc
  name         = var.splunk_password_secret
  key_vault_id = data.azurerm_key_vault.soc_vault.id
}

data "azurerm_key_vault_secret" "splunk_pass4symmkey" {
  provider     = azurerm.soc
  name         = var.splunk_pass4symmkey_secret
  key_vault_id = data.azurerm_key_vault.soc_vault.id
}



resource "azurerm_linux_virtual_machine_scale_set" "main" {
  name                = "${local.prefix}-vmss"
  resource_group_name = data.azurerm_subnet.iaas.resource_group_name
  location            = var.location
  sku                 = var.sku
  instances           = var.instance_count

  admin_username = local.adminuser
  admin_ssh_key {
    username   = local.adminuser
    public_key = data.azurerm_key_vault_secret.ssh_public_key.value
  }

  # Please note that custom_data updates will cause VMs to restart
  custom_data = data.template_cloudinit_config.config.rendered

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "${local.prefix}-ni"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = data.azurerm_subnet.iaas.id
    }
  }

  tags = var.common_tags
}

data "azurerm_log_analytics_workspace" "law" {
  provider            = azurerm.law
  name                = "hmcts-${local.environment}"
  resource_group_name = "oms-automation"
}

resource "azurerm_virtual_machine_scale_set_extension" "OmsAgentForLinux" {

  count = var.enable_log_analytics ? 1 : 0

  name                         = "OmsAgentForLinux"
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.main.id
  publisher                    = "Microsoft.EnterpriseCloud.Monitoring"
  type                         = "OmsAgentForLinux"
  type_handler_version         = "1.13"
  auto_upgrade_minor_version   = true

  settings = <<SETTINGS
    {
        "workspaceId": "${data.azurerm_log_analytics_workspace.law.workspace_id}"
    }
    SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
        "workspaceKey": "${data.azurerm_log_analytics_workspace.law.primary_shared_key}"
    }
    PROTECTED_SETTINGS
}


module "splunk-uf" {
  count = var.install_splunk_uf ? 1 : 0

  source = "git::https://github.com/hmcts/terraform-module-splunk-universal-forwarder.git?ref=master"

  auto_upgrade_minor_version   = true
  virtual_machine_type         = "vmss"
  virtual_machine_scale_set_id = azurerm_linux_virtual_machine_scale_set.main.id
  splunk_username              = data.azurerm_key_vault_secret.splunk_username.value
  splunk_password              = data.azurerm_key_vault_secret.splunk_password.value
  splunk_pass4symmkey          = data.azurerm_key_vault_secret.splunk_pass4symmkey.value
}
