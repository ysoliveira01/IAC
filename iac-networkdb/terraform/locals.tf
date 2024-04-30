locals {
  prefix = "${local.tags.resource}-${local.tags.environment}"
  tags = {
    environment = "prd"
    provider    = "terraform"
    team        = "platform"
    resource    = "databases-networks"
  }
}