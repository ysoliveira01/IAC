locals {
  prefix = "${local.tags.resource}-${local.tags.environment}"
  tags = {
    environment = "uat"
    provider    = "terraform"
    team        = "platform"
    resource    = "sql-server"
  }
}