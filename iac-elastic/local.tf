locals {
  prefix     = "${local.tags.resource}-${local.tags.environment}"
  kibana_url = "https://${var.kibana_host}"
  tags = {
    environment = "svc"
    provider    = "terraform"
    team        = "platform"
    resource    = "elastic"
  }
}