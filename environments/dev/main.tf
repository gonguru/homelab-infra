terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}

provider "kubernetes" {
  config_path    = var.kubeconfig_path
  config_context = "default"
}

module "app_namespace" {
  source = "../../modules/namespace"
  name   = "homelab-dev"
  labels = {
    environment = "dev"
    managed-by  = "terraform"
  }
}
