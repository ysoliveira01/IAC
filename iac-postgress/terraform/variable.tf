variable "database_username" {
  description = "The username for the database"
  type        = string
}

variable "database_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "database_sku" {
  description = "The SKU of the database"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "database_version" {
  description = "The version of the database"
  type        = string
  default     = "15"
}

variable "database_size" {
  description = "The size of the database in MB"
  type        = number
  default     = 32768
}

variable "location" {
  description = "The location of the resources"
  type        = string
  default     = "eastus"
}

variable "vnetdb_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnetdb_name" {
  description = "The name of the subnet"
  type        = string
}

variable "networkdb_rg" {
  description = "The name of the resource group for the network"
  type        = string
}