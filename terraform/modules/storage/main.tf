resource "azurerm_storage_account" "this" {
  name                     = replace("${var.name_prefix}st", "-", "")
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

resource "azurerm_storage_share" "library" {
  count                = var.create_file_share ? 1 : 0
  name                 = var.file_share_name
  storage_account_name = azurerm_storage_account.this.name
  quota                = var.file_share_quota_gb
}
