variable "release_name" {
  description = "The name of the Helm release."
  type        = string
}

variable "repository_url" {
  description = "The URL of the Helm chart repository."
  type        = string
}

variable "chart_name" {
  description = "The name of the Helm chart to deploy."
  type        = string
}

variable "values_file" {
  description = "Path to the YAML file containing Helm values."
  type        = string
}

variable "kubeconfig_path" {
  description = "Path to the Kubernetes configuration file."
  type        = string
}
