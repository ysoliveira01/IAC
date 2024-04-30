resource "azurerm_subnet" "pg_subnet1" {
  name                 = "postgres-${local.tags.environment}-snet-${var.location}-001"
  resource_group_name  = azurerm_resource_group.networkdb.name
  virtual_network_name = azurerm_virtual_network.networkdb.name
  address_prefixes     = ["10.144.0.0/16"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

resource "azurerm_private_dns_zone" "pg_priv_dns" {
  name                = "${local.tags.environment}.${var.location}.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.networkdb.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "pg_priv_dns" {
  name                  = "${local.prefix}-link-${var.location}"
  private_dns_zone_name = azurerm_private_dns_zone.pg_priv_dns.name
  virtual_network_id    = azurerm_virtual_network.networkdb.id
  resource_group_name   = azurerm_resource_group.networkdb.name

  depends_on = [azurerm_subnet.pg_subnet1]
}

resource "azurerm_private_dns_zone_virtual_network_link" "aks_to_db" {
  name                  = "databases-aks-link-${var.location}"
  private_dns_zone_name = azurerm_private_dns_zone.pg_priv_dns.name
  virtual_network_id    = var.aks_vnet_id
  resource_group_name   = azurerm_resource_group.networkdb.name
}