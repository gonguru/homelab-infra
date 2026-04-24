#dev environment - managed by Terraform :)
terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }

  backend "s3" {
   bucket                      = "terraform-state"
   key                         = "dev/terraform.tfstate"
   region                      = "us-east-1"
   endpoint                    = "http://localhost:9000"
   access_key                  = "minioadmin"
   secret_key                  = "minioadmin"
   skip_credentials_validation = true
   skip_metadata_api_check     = true
   skip_region_validation      = true
   skip_requesting_account_id  = true
   force_path_style            = true
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
