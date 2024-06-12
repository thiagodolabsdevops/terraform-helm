# Jenkins server on a Kubernetes cluster using Terraform and Helm

This project sets up a Jenkins server on a Kubernetes cluster using Terraform and Helm. The Jenkins installation is configured with a set of plugins and resource limits, defined in the `jenkins-values.yaml` file.

## Project Structure

```plaintext
.
├── README.md
├── jenkins-values.yaml
├── main.tf
├── providers.tf
└── variables.tf
```

## Files

- **README.md**: Documentation for the project.
- **jenkins-values.yaml**: Configuration values for the Jenkins Helm chart.
- **main.tf**: Terraform configuration for deploying Jenkins using Helm.
- **providers.tf**: Specifies the Terraform providers used in this project.
- **variables.tf**: Defines the variables used in the Terraform configuration.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.0 or higher
- [Helm](https://helm.sh/docs/intro/install/) v3.0 or higher
- Kubernetes cluster (e.g., [Minikube](https://minikube.sigs.k8s.io/docs/start/), [AKS](https://docs.microsoft.com/en-us/azure/aks/), [EKS](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html))
- Kubernetes configuration file (`~/.kube/config`)

## Setup

1. **Clone the repository**:

    ```bash
    git clone https://github.com/marublaize/terraform-k8s-jenkins.git
    cd terraform-k8s-jenkins
    ```

2. **Initialize Terraform**:

    ```bash
    terraform init
    ```

3. **Apply the Terraform configuration**:

    ```bash
    terraform apply -auto-approve
    ```

    This will deploy Jenkins on your Kubernetes cluster with the specified configurations.

## Configuration Details

### main.tf

Deploys the Jenkins Helm chart with values from `jenkins-values.yaml`:

```hcl
resource "helm_release" "jenkins" {
  name       = "jenkins"
  repository = "https://charts.jenkins.io"
  chart      = "jenkins"

  values = [
    file("jenkins-values.yaml")
  ]
}
```

### providers.tf

Specifies the required providers and configures them to use your local Kubernetes config:

```hcl
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
```

### jenkins-values.yaml

Contains the Helm values for configuring Jenkins:

```yaml
controller:
  image:
    tag: lts-jdk17
  installPlugins:
    - kubernetes
    - workflow-job
    - workflow-aggregator
    - credentials-binding
    - git
    - configuration-as-code
  resources:
    requests:
      cpu: "500m"
      memory: "512Mi"
    limits:
      cpu: "1000m"
      memory: "1024Mi"
```

## Cleanup

To remove the Jenkins deployment, run:

```bash
terraform destroy -auto-approve
```

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Terraform](https://www.terraform.io/)
- [Helm](https://helm.sh/)
- [Kubernetes](https://kubernetes.io/)
- [Jenkins](https://www.jenkins.io/)
