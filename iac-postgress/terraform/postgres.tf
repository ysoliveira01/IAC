resource "azurerm_resource_group" "grafana" {
  name     = "${local.prefix}-resources-${var.location}"
  location = var.location
}

resource "azurerm_postgresql_flexible_server" "grafana" {
  name                   = "${local.prefix}-psqlserver-${var.location}"
  resource_group_name    = azurerm_resource_group.grafana.name
  location               = azurerm_resource_group.grafana.location
  version                = var.database_version
  delegated_subnet_id    = data.azurerm_subnet.snet_pg_db.id
  private_dns_zone_id    = data.azurerm_private_dns_zone.pvdns_pg_db.id
  administrator_login    = var.database_username
  administrator_password = var.database_password
  zone                   = "1"

  storage_mb   = var.database_size
  storage_tier = "P4"

  sku_name = var.database_sku
}

resource "azurerm_postgresql_flexible_server_database" "grafana" {
  name      = "${local.prefix}-database-${var.location}"
  server_id = azurerm_postgresql_flexible_server.grafana.id
  collation = "pt_BR.utf8"
  charset   = "utf8"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}