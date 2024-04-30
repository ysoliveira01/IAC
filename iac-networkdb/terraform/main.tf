resource "azurerm_resource_group" "networkdb" {
  name     = "${local.prefix}-resources-${var.location}"
  location = var.location
  tags = merge(local.tags, {
  })
}

resource "azurerm_virtual_network" "networkdb" {
  name                = "${local.prefix}-vnet-${var.location}"
  location            = azurerm_resource_group.networkdb.location
  resource_group_name = azurerm_resource_group.networkdb.name
  address_space       = ["10.144.0.0/12"]

  tags = merge(local.tags, {
  })
}

# Recurso para criar um peering entre duas redes virtuais.
resource "azurerm_virtual_network_peering" "db_to_aks" {
  name                         = "db-to-aks"
  resource_group_name          = azurerm_resource_group.networkdb.name
  virtual_network_name         = azurerm_virtual_network.networkdb.name
  remote_virtual_network_id    = var.aks_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false
  lifecycle {
    prevent_destroy = true
  }
}