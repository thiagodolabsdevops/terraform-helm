module "jenkins_helm_release" {
  source         = "./modules"

  release_name   = "jenkins"
  repository_url = "https://charts.jenkins.io"
  chart_name     = "jenkins"
  values_file    = "config/jenkins-values.yaml"
  kubeconfig_path = "~/.kube/config"
}

# moved {
#   from = module.jenkins_helm_release.helm_release.jenkins
#   to   = module.jenkins_helm_release.helm_release.this
# }