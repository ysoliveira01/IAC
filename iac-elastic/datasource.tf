data "azurerm_kubernetes_cluster" "aks-example" {
  name                = var.aks_svc_name
  resource_group_name = var.aks_svc_rg
}