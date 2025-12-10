output "account_name" {
  value = azurerm_storage_account.this.name
}

output "primary_connection_string" {
  value = azurerm_storage_account.this.primary_connection_string
}

output "file_share_name" {
  value = try(azurerm_storage_share.library[0].name, null)
}
