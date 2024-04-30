data "azurerm_subnet" "snet_pg_db" {
  name                 = var.subnetdb_name
  virtual_network_name = var.vnetdb_name
  resource_group_name  = var.networkdb_rg
}

data "azurerm_private_dns_zone" "pvdns_pg_db" {
  name                = "prd.${var.location}.postgres.database.azure.com"
  resource_group_name = var.networkdb_rg
}