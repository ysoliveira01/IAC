
variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "eastus"
}

variable "aks_svc_name" {
  description = "The name of the AKS service"
  type        = string
}

variable "aks_svc_rg" {
  description = "The name of the resource group where the AKS service is located"
  type        = string
}

variable "kibana_host" {
  description = "The host of the application"
  type        = string
}

variable "elasticsearch_private_ip" {
  description = "The private IP of the elasticsearch service"
  type        = string
}

variable "elasticsearch_password" {
  description = "The password for the elastic user"
  type        = string
  sensitive   = true
}

variable "ssl_certificate" {
  description = "The SSL certificate to use for the ingress"
  type        = string
  sensitive   = true
}

variable "ssl_private_key" {
  description = "The SSL private key to use for the ingress"
  type        = string
  sensitive   = true
}