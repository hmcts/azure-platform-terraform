locals {
  prefix    = "activegate-nonprod"
  adminuser = "azureuser"
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

data "azurerm_key_vault_secret" "dynatrace_nonprod_api_key" {
  name         = "dynatrace-nonprod-api-key"
  key_vault_id = data.azurerm_key_vault.subscription_vault.id
}

data "azurerm_key_vault_secret" "ssh_public_key" {
  name         = "aks-ssh-pub-key"
  key_vault_id = data.azurerm_key_vault.subscription_vault.id
}

data "template_file" "nonprod_cloudconfig" {
  template = file("${path.module}/nonprod-cloudconfig.tpl")

  vars = {
    api_key                 = data.azurerm_key_vault_secret.dynatrace_nonprod_api_key.value
    dynatrace_instance_name = var.dynatrace_nonprod_instance_name
    network_zone            = "azure_cft"
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
