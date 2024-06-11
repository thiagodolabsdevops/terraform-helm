terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.30.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "2.13.2"
    }
    jenkins = {
      source  = "taiidani/jenkins"
      version = "0.10.2"
    }
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "jenkins" {
  server_url = "http://localhost:8080"
  username   = "admin"
  password   = var.jenkins_password
}
