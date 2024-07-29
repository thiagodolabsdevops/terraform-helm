resource "helm_release" "jenkins" {
  name       = var.release_name
  repository = var.repository_url
  chart      = var.chart_name

  values = [
    file(var.values_file)
  ]
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}
