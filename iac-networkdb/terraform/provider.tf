provider "azurerm" {
  features {}
  skip_provider_registration = true
}

# Provedor alternativo para o ambiente de produção
provider "azurerm" {
  alias = "prod"
  features {}
  subscription_id = var.prod_subscription_id
  tenant_id       = var.prod_tenant_id
  skip_provider_registration = true
}
