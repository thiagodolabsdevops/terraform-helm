variable "jenkins_password" {
  type        = string
  description = "Jenkins password"
  sensitive   = true
}

variable "jenkins_url" {
  type        = string
  description = "Jenkins URL"
  default     = "http://jenkins.svc.cluster.local:8080"
}