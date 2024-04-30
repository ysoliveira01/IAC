data "azurerm_virtual_network" "fortigate" {
  provider            = azurerm.prod # Use o provedor de recursos do ambiente de produção
  name                = var.fortigate-vnet-name
  resource_group_name = var.fortigate-resource-group-name
}