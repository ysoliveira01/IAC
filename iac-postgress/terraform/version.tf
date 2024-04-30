terraform {
  required_version = ">=1.0"

  backend "azurerm" {
    resource_group_name  = "name-rg"
    storage_account_name = "name-storage"
    container_name       = "tfstate"
    key                  = "key"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}
