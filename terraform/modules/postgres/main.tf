resource "azurerm_postgresql_flexible_server" "this" {
  name                   = "${var.name_prefix}-pg"
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_login_password
  sku_name               = var.sku_name
  version                = "16"

  storage_mb = var.storage_mb

  backup_retention_days = var.backup_retention_days
  high_availability     = var.high_availability

  # If you want private networking, later you add:
  # delegated_subnet_id          = var.db_subnet_id
  # private_dns_zone_id          = var.private_dns_zone_id

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "immich" {
  name      = "immich"
  server_id = azurerm_postgresql_flexible_server.this.id
  charset   = "UTF8"
  collation = "en_US.utf8"
}
