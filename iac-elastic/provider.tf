provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id            = "id-sub"
}

provider "kubernetes" {
  host                   = data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.host
  username               = data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.username
  password               = data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.password
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.client_certificate)
  client_key             = base64decode(data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host                   = data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.host
    username               = data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.username
    password               = data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.password
    client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.client_certificate)
    client_key             = base64decode(data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks_svc.kube_config.0.cluster_ca_certificate)
  }
}