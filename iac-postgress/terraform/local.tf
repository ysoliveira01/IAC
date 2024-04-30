locals {
  prefix = "${local.tags.resource}-${local.tags.environment}"
  tags = {
    environment = "develop"
    provider    = "terraform"
    team        = "platform"
    resource    = "grafana"
  }
}