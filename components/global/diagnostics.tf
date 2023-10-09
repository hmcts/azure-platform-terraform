resource "azurerm_storage_account" "diagnostics" {
  name                     = "hmctscftdiag${var.env}"
  account_replication_type = "ZRS"
  account_tier             = "Standard"
  location                 = var.location
  resource_group_name      = data.azurerm_resource_group.main.name

  tags = module.ctags.common_tags
}

resource "azurerm_storage_management_policy" "diagnostics" {
  storage_account_id = azurerm_storage_account.diagnostics.id

  rule {
    name    = "delete"
    enabled = true
    filters {
      blob_types = ["appendBlob"]
    }
    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 90
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 90
      }
      version {
        delete_after_days_since_creation = 90
      }
    }
  }
}
