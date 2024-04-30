resource "azurerm_sql_database" "name-example" {
  name                = var.name
  server_name         = data.azurerm_sql_server.example.name
  location            = var.location
  resource_group_name = var.resource_group_name
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb         = 4
  min_capacity        = 0.5
  read_scale          = true
  sku_name            = "GP_S_Gen5_1"
  
  tags = {
    foo = ""
  }
}

resource "azurerm_storage_account" "example_storage" {
  name                     = "${var.name}store" # Nome exclusivo para o recurso de armazenamento
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}