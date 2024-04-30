resource "kubernetes_namespace_v1" "elastic" {
  metadata {
    name = "elastic"
  }
  lifecycle {
    ignore_changes = [metadata[0].annotations]
  }
}

resource "helm_release" "elasticsearch" {
  name       = "${local.prefix}-es"
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
  namespace  = kubernetes_namespace_v1.elastic.metadata[0].name
  version    = "8.5.1"
  values = [templatefile("${path.module}/elasticsearch-values.tftpl", {
    elasticsearch_private_ip = "${var.elasticsearch_private_ip}",
    elasticsearch_password   = "${var.elasticsearch_password}"
  })]
  timeout = "500"
}

resource "helm_release" "kibana" {
  name       = "${local.prefix}-kb"
  repository = "https://helm.elastic.co"
  chart      = "kibana"
  namespace  = kubernetes_namespace_v1.elastic.metadata[0].name
  version    = "8.5.1"
  values = [templatefile("${path.module}/kibana-values.tftpl", {
    kibana_url  = "${local.kibana_url}",
    kibana_host = "${var.kibana_host}",
    tls_secret  = "${kubernetes_secret_v1.tls.metadata[0].name}"
  })]
  timeout    = "500"
  depends_on = [helm_release.elasticsearch]
}

resource "kubernetes_secret_v1" "tls" {
  metadata {
    name      = ""
    namespace = kubernetes_namespace_v1.elastic.metadata[0].name
  }
  data = {
    "tls.crt" = base64decode(var.ssl_certificate)
    "tls.key" = base64decode(var.ssl_private_key)
  }
  type = "kubernetes.io/tls"
}