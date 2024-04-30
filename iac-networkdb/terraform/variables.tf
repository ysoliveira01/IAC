variable "location" {
  description = "The location/region where the resource group will be created."
  default     = "eastus"
}

variable "prod_subscription_id" {
  description = "The Production environment Subscription ID."
  type        = string
}

variable "prod_tenant_id" {
  description = "The Production environment Tenant ID."
  type        = string
}

variable "fortigate-resource-group-name" {
  description = "The name of the resource group for the FortiGate resources"
  type        = string
}

variable "fortigate-vnet-name" {
  description = "The name of the virtual network for the FortiGate resources"
  type        = string
}

variable "aks_vnet_id" {
  description = "The ID of the virtual network where the AKS will be created."
}