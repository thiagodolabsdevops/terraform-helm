variable "release_name" {
  description = "The name of the Helm release."
  type        = string
  default     = "jenkins"
}

variable "repository_url" {
  description = "The URL of the Helm chart repository."
  type        = string
  default     = "https://charts.jenkins.io"
}

variable "chart_name" {
  description = "The name of the Helm chart to deploy."
  type        = string
  default     = "jenkins"
}

variable "values_file" {
  description = "Path to the YAML file containing Helm values."
  type        = string
  default     = "config/jenkins-values.yaml"
}

variable "kubeconfig_path" {
  description = "Path to the Kubernetes configuration file."
  type        = string
  default     = "~/.kube/config"
}
