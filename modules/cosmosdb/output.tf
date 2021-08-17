output "cosmos_db_url" {
  value = "${azurerm_cosmosdb_account.main.id}.documents.azure.com"
}

output "primary_master_key" {
  value = azurerm_cosmosdb_account.main.primary_master_key
}